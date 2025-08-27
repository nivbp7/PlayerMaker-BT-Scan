//
//  MainView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct MainView: View {
    enum Route: Hashable {
        case scanner
    }
    
    @State private var path: [Route] = []
    private let store: FavoritesStore
    
    init(store: FavoritesStore) {
        self.store = store
    }

    var body: some View {
        NavigationStack(path: $path) {
            FavoritesListView(viewModel: FavoritesViewModel(store: store))
                .navigationTitle("Favorite Devices")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        AddDevicesButton { path.append(.scanner) }
                    }
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .scanner: ScanView(viewModel: ScannerViewModel(bluetoothManager: BluetoothManager(), store: store))
                    }
                }
        }
    }
}

//#Preview {
//    MainView()
//}
