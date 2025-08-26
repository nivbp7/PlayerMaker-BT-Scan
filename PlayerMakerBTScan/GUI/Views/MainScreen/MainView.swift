//
//  MainView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationStack {
            FavoritesListView(viewModel: FavoritesViewModel())
                .navigationTitle("Favorite Devices")
        }
    }
}


#Preview {
    MainView()
}
