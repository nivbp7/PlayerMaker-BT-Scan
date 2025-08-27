//
//  RootView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct RootView: View {
    @State private var isShowingSplashView = true
    private let favoritesViewModel: FavoritesViewModel
    private let scannerViewModel: ScannerViewModel
    
    init(favoritesViewModel: FavoritesViewModel, scannerViewModel: ScannerViewModel) {
        self.favoritesViewModel = favoritesViewModel
        self.scannerViewModel = scannerViewModel
    }
    
    var body: some View {
        if isShowingSplashView {
            SplashScreenView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation { isShowingSplashView = false }
                    }
                }
        } else {
            MainView(favoritesViewModel: favoritesViewModel, scannerViewModel: scannerViewModel)
        }
    }
}

//#Preview {
//    RootView()
//}
