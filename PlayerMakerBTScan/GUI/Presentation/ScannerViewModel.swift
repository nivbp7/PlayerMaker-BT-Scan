//
//  ScannerViewModel.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 27/08/2025.
//

import Foundation

final class ScannerViewModel: ObservableObject {
    let bluetoothManager: BluetoothManager
    
    @Published private(set) var devices: [BluetoothDevice] = []
    
    init(bluetoothManager: BluetoothManager) {
        self.bluetoothManager = bluetoothManager
        
        bluetoothManager.$bluetoothDevices
            .assign(to: &$devices)
    }
    
    func startScan() {
        bluetoothManager.startScan()
    }
    
    func stopScan() {
        bluetoothManager.stopScan()
    }
    
}
