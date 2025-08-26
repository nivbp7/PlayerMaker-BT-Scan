//
//  EmptyListView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "star.slash")
                .font(.system(size: 50))
            Text("No favorite devices")
                .font(.headline)
            Text("Tap “Add New Devices” to scan for devices.\nPlease make sure your phone's Bluetooth is enabled.")
                .multilineTextAlignment(.center)
                .font(.body)
        }
    }
}

#Preview {
    EmptyListView()
}
