//
//  ScanView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct ScanView: View {
    @StateObject var viewModel: ScannerViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.devices) { device in
                    DiscoveredDeviceView(device: device, isFav: viewModel.isFavorite(device.id))
                        .onTapGesture {
                            viewModel.insert(device: device)
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
