//
//  DiscoveredDeviceView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 27/08/2025.
//

import SwiftUI

struct DiscoveredDeviceView: View {
    let device: BluetoothDevice
    let isFav: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 20) {
                    Text(device.name)
                        .font(.title3)
                    Text("\(device.rssi.intValue)")
                        .font(.footnote)
                }
                Text(device.id)
                    .font(.caption)
            }
            if isFav {
                Image(systemName: "star.fill")
                    
            } else {
                EmptyView()
            }
            
        }
        .foregroundStyle(isFav ? Color.accentColor : Color.init(uiColor: .label))
    }
}

#Preview {
    DiscoveredDeviceView(device: BluetoothDevice.demo, isFav: true)
}
