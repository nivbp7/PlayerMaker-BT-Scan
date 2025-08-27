//
//  PlayerMakerBTScanApp.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

@main
struct PlayerMakerBTScanApp: App {
    var body: some Scene {
        WindowGroup {
            ViewFactory.makeRootView()
        }
    }
}

class ViewFactory {
    private init() {}
    
    static func makeRootView() -> RootView {
        let store = FavoritesStore()
        let bluetoothManager = BluetoothManager()
        let favoritesViewModel = FavoritesViewModel(store: store)
        let scannerViewModel = ScannerViewModel(bluetoothManager: bluetoothManager, store: store)
        return RootView(favoritesViewModel: favoritesViewModel, scannerViewModel: scannerViewModel)
    }
}
