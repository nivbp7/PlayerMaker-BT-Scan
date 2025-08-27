//
//  ScannerViewModel.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 27/08/2025.
//

import Foundation

final class ScannerViewModel: ObservableObject {
    let bm = BluetoothManager()
    
    @Published private(set) var devices: [BluetoothDevice] = []
    
    init() {
        bm.$bluetoothDevices
            .assign(to: &$devices)
    }
    
    func startScan() {
        bm.startScan()
    }
    
    func stopScan() {
        bm.stopScan()
    }
    
}
