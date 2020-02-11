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
    func fetchFavoriteMovies()
    func deleteMovie(id: Int64)
    func onLoadingMovies(_ movies: [Movie])
    
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
    
    func fetchFavoriteMovies() {
        let favoriteMovies: [Movie] = favoriteServiceProtocol.readFavoriteMovieTable()
        onLoadingMovies(favoriteMovies)
    }
    
    func deleteMovie(id: Int64) {
        favoriteServiceProtocol.deleteFavoritMovieRow(id: id)
    }
    
    func onLoadingMovies(_ movies: [Movie]) {
        favoritesView?.showFavoriteMovies(movies)
    }
    
}
