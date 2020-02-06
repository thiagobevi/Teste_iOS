//
//  FavoritesPresenterTest.swift
//  TestTMBDTests
//
//  Created by Thiago Bevilacqua on 2/6/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import Foundation
import Quick
import Nimble
import SQLite3


@testable import TestTMBD

final class FavoritestPresenterTeste: QuickSpec {
    
    override func spec() {
           
           var sut: FavoritesPresentable!
           var service: FavoritesServiceSpy!
           var view: FavoritesViewSpy!
        
        describe("FavoritesPresentable") {
            
            beforeEach {
                var view = FavoritesViewSpy()
                var service = FavoritesServiceSpy()
                var sut = FavoritesPresenter(service: service)
                sut.atachView(view: view)
            }
            
            describe("When favorite view is called") {
                
                context("And DB return success ") {
                    
                    beforeEach {
                        sut.loadFavoriteMovies()
                    }
                    
                    it("should load favorite movies list") {
                        expect(view.favoriteMovies.isEmpty).to(beFalse())
                    }
                }
            }
        }
    }
    
}


class FavoritesServiceSpy: FavoritesServiceProtocol {
    func readFavoritesTable() {
        
    }
    
    func deleteFavoriteRow() {
        
    }
    
    
}


class FavoritesViewSpy: FavoritesView {
    var favoriteMovies: [Movie] = []
    
    func attachView(view: FavoritesView) {
        
    }
    
    func loadFavorites() {
        
    }
    
    func deleteFavorite(id: Int) {
        
    }
    
    
}
