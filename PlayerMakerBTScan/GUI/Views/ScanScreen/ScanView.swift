//
//  ScanView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct ScanView: View {
    
    @StateObject var viewModel: ScannerViewModel
    var store = FavoritesStore()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.devices) { device in
                    DiscoveredDeviceView(device: device, isFav: true)
                        .onTapGesture {
                            store.insert(device.localDevice)
                        }
                }
            }
        }
        .onAppear {
            viewModel.startScan()
        }
        .onDisappear {
            viewModel.stopScan()
        }
    }
}
