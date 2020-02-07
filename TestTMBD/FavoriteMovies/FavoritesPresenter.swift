//
//  FavoritesPresenter.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/5/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import Foundation

protocol FavoritesPresentable: class {
    func atachView(view: FavoritesView)
    func loadFavoriteMovies() -> [Movie]
    func deleteMovie(id: Int)
    
}

class FavoritesPresenter: FavoritesPresentable {

    private var favoritesView: FavoritesView?
    private var favoriteServiceProtocol: FavoritesServiceProtocol
    
    init(service: FavoritesServiceProtocol) {
        self.favoriteServiceProtocol = service
    }
    
    func atachView(view: FavoritesView) {
        favoritesView = view
    }
    
    func loadFavoriteMovies() -> [Movie] {
        
        let favoriteMovies: [Movie] = favoriteServiceProtocol.readFavoriteMovieTable()
        return favoriteMovies
    }
    
    func deleteMovie(id: Int) {
        favoriteServiceProtocol.deleteFavoritMovieRow()
    }
    
     
 

    
    
}
