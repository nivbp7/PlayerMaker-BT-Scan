//
//  FavoritesListView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct FavoritesListView: View {
    @State private var viewModel = FavoritesViewModel()
    
    var body: some View {
        if viewModel.favorites.isEmpty {
            Text("Empty")
        } else {
            List {
                ForEach(viewModel.favorites) { device in
                    FavoriteDeviceView(device: device)
                }
            }
        }
    }
}
