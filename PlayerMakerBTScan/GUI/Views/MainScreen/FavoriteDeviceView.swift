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
        VStack {
            Text(device.name)
            Text(device.id)
        }
    }
}

#Preview {
    FavoriteDeviceView(device: Device(id: "1", name: "2", nickname: "3"))
}
