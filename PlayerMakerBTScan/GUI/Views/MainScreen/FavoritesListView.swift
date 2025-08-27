//
//  FavoritesListView.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import SwiftUI

struct FavoritesListView: View {
    @State var viewModel: FavoritesViewModel
    
    var body: some View {
        if viewModel.favorites.isEmpty {
            EmptyListView()
        } else {
            List {
                ForEach(viewModel.favorites) { device in
                    FavoriteDeviceView(device: device)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.remove(device.id)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                }
            }
        }
    }
}
