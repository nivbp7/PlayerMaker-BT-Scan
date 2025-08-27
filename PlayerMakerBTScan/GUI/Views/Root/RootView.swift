//
//  RootView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct RootView: View {
    @State private var isShowingSplashView = true
    private let store = FavoritesStore()
    
    var body: some View {
        if isShowingSplashView {
            SplashScreenView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation { isShowingSplashView = false }
                    }
                }
        } else {
            MainView(store: store)
        }
    }
}

#Preview {
    RootView()
}
