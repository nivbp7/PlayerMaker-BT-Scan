//
//  ScannerViewModel.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 27/08/2025.
//

import Foundation

final class ScannerViewModel: ObservableObject {
    private let bluetoothManager: BluetoothManager
    private let store: FavoritesStore
    
    @Published private(set) var devices: [BluetoothDevice] = []
    
    init(bluetoothManager: BluetoothManager, store: FavoritesStore) {
        self.bluetoothManager = bluetoothManager
        self.store = store
        
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
