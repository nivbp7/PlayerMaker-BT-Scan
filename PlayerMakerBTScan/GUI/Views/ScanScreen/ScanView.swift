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
                    Text(device.name)
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
