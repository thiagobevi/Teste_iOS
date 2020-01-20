//
//  MoviesListPresenter.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/23/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit
import Alamofire

protocol MoviesListPresentable: class {
    func moviesList(page: Int)
    func searchMovie(text: String, page: Int)
    func didSelectMovie(movie: Movie)
}

class MoviesListPresenter: MoviesListPresentable {
    
    private var moviesView: MoviesListView?
    private var serviceProtocol: MovieListServiceProtocol
    
    init(service: MovieListServiceProtocol) {
        self.serviceProtocol = service
    }
    
    func atatchView(view: MoviesListView) {
          moviesView = view
    }
    
    func moviesList(page: Int) {
        serviceProtocol.moviesList(page: page) { [weak self] result in
            self?.moviesView?.showMoviesList(moviesOk: result!.results)
        }
    }
    
    func searchMovie(text: String, page: Int) {
         serviceProtocol.searchMovieData(text: text, page: page) { [weak self] result in
            guard result != nil else {
                return
            }
            
            self?.moviesView?.showSearchMovie(searchedMovie: result!.results) //(moviesOk: result!.results)
        }
    }
    
    func didSelectMovie(movie: Movie) {
        moviesView?.showDetails(movie: movie)
    }
    
}
