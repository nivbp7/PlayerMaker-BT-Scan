//
//  ScanView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct ScanView: View {
    
    let bm = BluetoothManager()
    
    var body: some View {
        VStack {
            Text("BT")
        }
        .onAppear(perform: {
            bm.startScan()
        })
    }
}

#Preview {
    ScanView()
}
