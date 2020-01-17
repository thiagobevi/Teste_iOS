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
        
        var sut: MoviesListPresenter!
        var service: MoviesListServiceSpy!
        var view: MoviesListViewSpy!
        
        describe("MoviesListPresenterTest") {
            
            beforeEach {
                service = MoviesListServiceSpy()
                view = MoviesListViewSpy()
                sut = MoviesListPresenter(service: service, serviceClass: service!)
                sut.attachView(view: view)
            }
            
            describe("When user open`s the app") {
                
                context("and returns 200 from API") {
                    
                    beforeEach {
                        sut.moviesList(page: 1)
                    }
                    
                    it("then should be loaded a most popular movies list") {
                        expect(view.showMoviesList(moviesOk: movies)).to(beTrue())
                    }
                    
                    it("Must contain 20 movies on list") {
                        
                    }
                    
                    it("Must be loaded the movie image in each cell") {
                        
                    }
                    
                    it("When cell is tapped, must show Details Movie View") {
                        
                    }
                    
                    it("When scroll-up SearchBar is visible") {
                        
                    }
                    
                    it("When Scroll-down Load More Movies button is visible") {
                        
                    }
                    
                    context("Tap Load More Movies button") {
                        
                        it("Should apend more 20 movies to array")  {
                            
                        }
                        
                        it("Must bring results from next API endpoint page") {
                            
                        }
                    }
                    
                    context("Just Tap SearchBar") {
                        
                        it("Keyboard must be showed") {
                            
                        }
                        
                        it("Search button must be inative") {
                            
                        }
                    }
                    
                    context("Type a valid movie on SearchBar text field") {
                        
                        it("Search button must be active") {
                            
                        }
                        
                        it("Must return movie list that contains the typed text") {
                            
                        }
                        
                        it("Must append result at searchedMovies array") {
                            
                        }
                    }
                    
                    context("Tap Cancel button after returns Search movie list") {
                        
                        it("Must removeAll from movies array") {
                            
                        }
                        
                        it("Should do a new request on Popular Movies endpoint") {
                            
                        }
                        
                        
                    }
                }
            }
        }
    }
}



private class MoviesListServiceSpy: MovieListServiceProtocol {
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
    var moviesPassed: Movie?
    
    
    func requestAuth() {
    }
    
    func moviesList() {
    }
    
    func showMoviesList(moviesOk: [Movie]) {
        
    }
    
    func showDetails(movie: Movie) {
        showDetailsCalled = true
        moviesPassed = movie
    }
    
    func searchMovie(text: String) {
        
    }
    
    func showSearchMovie(searchedMovie: [Movie]) {
        
    }
    
    
}


