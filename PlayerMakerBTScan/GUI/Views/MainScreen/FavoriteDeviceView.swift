//
//  FavoriteDeviceView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct FavoriteDeviceView: View {
    let device: Device
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(device.shownName())
                .font(.title3)
            Text(device.id)
                .font(.caption)
        }
    }
}

#Preview {
    FavoriteDeviceView(device: Device.demoWithNickname)
}
