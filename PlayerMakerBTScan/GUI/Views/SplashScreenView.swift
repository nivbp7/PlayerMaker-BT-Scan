//
//  SplashScreen.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            Text("Niv Ben-Porath")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    SplashScreenView()
}
