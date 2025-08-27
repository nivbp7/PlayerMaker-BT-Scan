//
//  FavoritesStore.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 27/08/2025.
//

import Foundation

final class FavoritesStore {
    private struct SavedItem: Codable {
        let id: String
        let name: String
        let nickname: String?
        
        var localDevice: Device {
            return Device(id: id, name: name, nickname: nickname)
        }
    }
    
    private let key = "favorites_v1"
    private let defaults: UserDefaults
    private var items: [SavedItem] = []
    private let queue = DispatchQueue(label: "\(FavoritesStore.self)Queue", qos: .userInitiated, attributes: .concurrent)

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        self.items = savedItems()
    }
    
    func insert(_ device: Device) {
        let item = SavedItem(id: device.id, name: device.name, nickname: device.nickname)
        items.append(item)
        save()
    }
    
    func favorites() -> [Device] {
        return items.map { $0.localDevice }
    }
    
    private func savedItems() -> [SavedItem] {
        guard let data = defaults.data(forKey: key) else { return [] }
        let decoder = JSONDecoder()
        return (try? decoder.decode([SavedItem].self, from: data)) ?? []
    }
    
    private func save() {
        queue.async(flags: .barrier) {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(self.items)
                self.defaults.set(data, forKey: self.key)
            } catch {
                print("Save error")
            }
        }
    }
}
