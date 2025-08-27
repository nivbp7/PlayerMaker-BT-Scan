//
//  BluetoothDevice.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import Foundation

struct BluetoothDevice: Identifiable {
    let id: String
    let name: String
    let rssi: NSNumber
}

extension BluetoothDevice {
    static let demo = BluetoothDevice(id: "3cca58c0-0e93-4493-9e01-1278d67aef1", name: "Niv's iPhone 16", rssi: NSNumber(integerLiteral: 30))
}
