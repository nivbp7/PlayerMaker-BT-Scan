//
//  FavoritesViewModel.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import Foundation

@Observable
final class FavoritesViewModel {
    private let store: FavoritesStore
    
    private(set) var favorites: [Device] = []
    
    init(store: FavoritesStore) {
        self.store = store
        load()
    }
    
    private func load() {
        favorites = store.favorites()
    }
    
    func reload() {
        load()
    }
    
    func remove(_ id: String) {
        store.remove(id)
        reload()
    }
    
}
