//
//  FavoritesView.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/5/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import Foundation

protocol FavoritesView {
    func attachView(view: FavoritesView)
    func loadFavorites()
    func deleteFavorite(id: Int)
}
