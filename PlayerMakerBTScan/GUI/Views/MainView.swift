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
            FavoritesListView()
                .navigationTitle("Favorite Devices")
        }
    }
}

struct FavoritesListView: View {
    @State private var viewModel = FavoritesViewModel()
    
    var body: some View {
        if viewModel.favorites.isEmpty {
            Text("Empty")
        } else {
            Text("Devices")
        }
    }
}
