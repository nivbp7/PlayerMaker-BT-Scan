//
//  FavoritesViewModel.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import Foundation

@Observable
final class FavoritesViewModel {
    private let store: FavoritesStore
    
    init(store: FavoritesStore) {
        self.store = store
    }
    
    func favorites() -> [Device] {
        store.favorites()
    }    
}
