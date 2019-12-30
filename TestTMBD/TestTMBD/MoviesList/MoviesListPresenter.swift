//
//  MoviesListPresenter.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/23/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit
import Alamofire

protocol RequestAuthPresentable {
    func requestAuth()
}

protocol RequestMoviesListPresentable {
    func moviesList()
}

class MoviesListPresenter: RequestAuthPresentable, RequestMoviesListPresentable {
    var movies: [Movie]?
    
    private var moviesView: MoviesListView?
    // private var serviceProtocol: MovieListServiceProtocol
    var serviceClass: MoviesListService
    var vc: MoviesTableViewController?
    
    init(service: MovieListServiceProtocol, serviceClass: MoviesListService ) {
        // self.serviceProtocol = service
        self.serviceClass = serviceClass
    }
    
    
    func attachView(view: MoviesListView){
        moviesView = view
    }
    
    func requestAuth() {
        let params = serviceClass.parameters
        serviceClass.requestAuth(parameters: params) { [weak self] result in
            guard result != nil else {
                return
            }
            
            self?.moviesView?.requestAuth()
        }
    }
    
    func moviesList() {
        serviceClass.moviesList { [weak self] result in
            self?.moviesView?.showMoviesList(moviesOk: result!.results)
        }
    }
    
    func searchMovie(text: String) {
        serviceClass.searchMovieData(text: text) { [weak self] result in
            guard result != nil else {
                return
            }
            
            self?.moviesView?.showMoviesList(moviesOk: result!.results)
        }
    }
}
