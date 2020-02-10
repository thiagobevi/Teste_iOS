//
//  FavoritesService.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/5/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import Foundation
import SQLite3

protocol FavoritesServiceProtocol {
    func addFavoriteMovie(movie: Movie)
    func readFavoriteMovieTable() -> [Movie]
    func deleteFavoritMovieRow()
}

class FavoritesService: FavoritesServiceProtocol {
    
    let database: DatabaseProtocol
    init(database: Database) {
        self.database = database
    }
    
    
    func readFavoriteMovieTable() -> [Movie] {
        database.loadDatabase()
    }
    
    
    
    func addFavoriteMovie(movie: Movie) {
        
    }
    
    
    func deleteFavoritMovieRow() {
        
    }
    
}

