//
//  MoviesListPresenterTest.swift
//  TestTMBDTests
//
//  Created by Thiago Bevilacqua on 1/16/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import Quick
import Nimble
import Alamofire

@testable import TestTMBD

final class MoviesListPresenterTeste: QuickSpec {
    
    override func spec() {
        
        var sut: MoviesListPresentable!
        var service: MoviesListServiceSpy!
        var view: MoviesListViewSpy!
        
        describe("MoviesListPresenterTest") {
            
            beforeEach {
                service = MoviesListServiceSpy()
                view = MoviesListViewSpy()
                sut = MoviesListPresenter(service: service)
            }
            
            describe("When user open`s the app") {
                
                context("and returns 200 from API") {
                    
                    beforeEach {
                        sut.moviesList(page: 1)
                    }
                    
                    it("then should be loaded a most popular movies list") {
                        expect(view.movies?.isEmpty).to(beFalse())
                    }
                }
                
                describe("When cell is tapped, must show Details Movie View") {
                
                    it("then should present detail view") {
                        sut.didSelectMovie(movie: Movie(title: "title value", id: 0, release_date: nil, overview: nil, vote_average: nil, poster_path: nil, backdrop_path: nil))
                        
                        expect(view.showDetailsCalled).to(beTrue())
                        expect(view.moviePassed?.title) == "title value"
                    }
                
                }
            
                    
                describe("Tap Load More Movies button") {

                        it("Should apend more movies to array")  {
                            sut.moviesList(page: 2)
                        }


                    }
//
//
//                    context("Type a valid movie on SearchBar text field") {
//
//
//
//                        it("Must return movie list that contains the typed text") {
//
//                        }
//
//                        it("Must append result at searchedMovies array") {
//
//                        }
//                    }
//
//                    context("Tap Cancel button after returns Search movie list") {
//
//                        it("Must removeAll from movies array") {
//
//                        }
//
//                        it("Should do a new request on Popular Movies endpoint") {
//
//                        }
//
//
//                    }
            }
        }
    }
}



private class MoviesListServiceSpy: MovieListServiceProtocol {
   
    func searchMovieData(text: String, page: Int, completion: @escaping (MovieResponse?) -> ()) {
        
    }
    
    func requestAuth(parameters: Parameters, completion: @escaping (Token?) -> ()) {
        
    }
    
    func moviesList(page: Int, completion: @escaping (MovieResponse?) -> ()) {
        if page > 0 {
            completion(MovieResponse(results: [Movie(title: "Rambo", id: 100, release_date: "2019-04-04", overview: "OverTests", vote_average: 4.5, poster_path: "aaa", backdrop_path: "bbb")]))
        } else {
            
        }
    }
    
}

private class MoviesListViewSpy: MoviesListView {
    var showDetailsCalled: Bool?
    var moviePassed: Movie?
    var movies: [Movie]?
    
    func requestAuth() {
    }
    
    func moviesList() {
    }
    
    func showMoviesList(moviesOk: [Movie]) {
        movies = moviesOk
    }
    
    func showDetails(movie: Movie) {
        showDetailsCalled = true
        moviePassed = movie
    }
    
    func searchMovie(text: String) {
        
    }
    
    func showSearchMovie(searchedMovie: [Movie]) {
        
    }
    
    
}


