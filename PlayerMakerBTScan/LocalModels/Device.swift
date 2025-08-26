//
//  Device.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import Foundation

struct Device: Identifiable {
    let id: String
    let name: String
    var nickname: String?
}

extension Device {
    static let demo = Device(id: "3cca58c0-0e93-4493-9e01-1278d67aef1", name: "Niv's iPhone 16")
    static let demo2 = Device(id: "3cca58c0-0e93-4493-9e01-1278d67aef2", name: "Niv's iPh")
    static let demoWithNickname = Device(id: "3cca58c0-0e93-4493-9e01-1278d67aef3", name: "Niv's iPhone 16", nickname: "My phone")
}

extension Device {
    func shownName() -> String {
        return nickname ?? name
    }
}
