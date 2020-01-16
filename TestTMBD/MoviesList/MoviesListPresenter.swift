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
    func moviesList(page: Int)
}

class MoviesListPresenter: RequestAuthPresentable, RequestMoviesListPresentable {
    
    private var moviesView: MoviesListView?
    // private var serviceProtocol: MovieListServiceProtocol
    var serviceClass: MoviesListService
  
    
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
    
    func moviesList(page: Int) {
        serviceClass.moviesList(page: page) { [weak self] result in
            self?.moviesView?.showMoviesList(moviesOk: result!.results)
        }
    }
    
    func searchMovie(text: String, page: Int) {
        serviceClass.searchMovieData(text: text, page: page) { [weak self] result in
            guard result != nil else {
                return
            }
            
            self?.moviesView?.showSearchMovie(searchedMovie: result!.results) //(moviesOk: result!.results)
        }
    }
    
    
}
