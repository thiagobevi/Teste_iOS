//
//  MoviesListView.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/23/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import Foundation

protocol MoviesListView {
    func moviesList()
    func showMoviesList(moviesOk: [Movie])
    func showDetails(movie: Movie)
    func searchMovie(text: String)
    func showSearchMovie(searchedMovie: [Movie])
    
}
