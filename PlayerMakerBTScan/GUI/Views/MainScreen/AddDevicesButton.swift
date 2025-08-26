//
//  AddDevicesButton.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct AddDevicesButton: View {
    var didTapButton: (() -> Void)?
    
    var body: some View {
        Button(action: {
            didTapButton?()
        }, label: {
            Text("Add New Devices")
                .font(.callout)
        })
    }
}

#Preview {
    AddDevicesButton()
}
