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
    func createTableMovie() 
    func addFavoriteMovie()
    func readFavoriteMovieTable() -> [Movie]
    func deleteFavoritMovieRow()
}

class FavoritesService: FavoritesServiceProtocol {
    
    var db: OpaquePointer?
    var favoriteMovies: [Movie] = []
    var movie: Movie?
    func deleteFavoritMovieRow() {
        
    }
    
    func readFavoriteMovieTable() -> [Movie] {
        
        var stmt: OpaquePointer?
        let selectQuery = "SELECT * FROM FavoriteMovies"
        
        //       let fileUrl =  try!
        //                  FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FavoriteMoviesDatabase.sqlite")
        //
        //              if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
        //                  print("Error opening database")
        //        }
        
        if sqlite3_prepare_v2(db, selectQuery, -1, &stmt, nil) != SQLITE_OK {
            print("Error selecting query")
        } else {
            while sqlite3_step(stmt) == SQLITE_ROW {
                let title = String(describing: String(cString: sqlite3_column_text(stmt, 1)))
                let idTMDB = sqlite3_column_int(stmt, 2)
                let release_date = String(describing: String(cString: sqlite3_column_text(stmt, 3)))
                let overview = String(describing: String(cString: sqlite3_column_text(stmt, 4)))
                let vote_average = sqlite3_column_double(stmt, 5)
                let poster_path = String(describing: String(cString: sqlite3_column_text(stmt, 6)))
                let backdrop_path = String(describing: String(cString: sqlite3_column_text(stmt, 7)))
                
                favoriteMovies.append(Movie(title: title, id: Int(idTMDB), release_date: release_date, overview: overview, vote_average: vote_average, poster_path: poster_path, backdrop_path: backdrop_path))
            }
        }
        sqlite3_finalize(stmt)
        return favoriteMovies
        
    }
    
    func createTableMovie() {
        let fileUrl =  try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("FavoriteMovies.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            print("Error opening database")
            return
        }
        let createTableQuery = "CREATE TABLE IF NOT EXISTS FavoriteMovies (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, idTMDB INTEGER, release_date TEXT, overview TEXT, vote_average REAL, poster_path TEXT, backdrop_path TEXT )"
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error creating Table")
            return
        }
        print("All good")
    }
    
    
    func addFavoriteMovie() {
        var stmt: OpaquePointer?
        let insertQuery = "INSERT INTO FavoriteMovies (title, idTMDB, release_date, overview, vote_average, poster_path, backdrop_path) VALUES (?, ?, ?, ?, ?, ?, ?)"
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &stmt, nil) != SQLITE_OK {
            print("Error binding query")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, movie?.title, -1, nil) != SQLITE_OK {
            print("Error binding name")
        }
        
        if sqlite3_bind_int(stmt, 2, (movie?.id)!) != SQLITE_OK {
            print("Error binding rank")
        }
        
        if sqlite3_bind_text(stmt, 3, movie?.release_date, -1, nil) != SQLITE_OK {
            print("Error binding rank")
        }
        
        if sqlite3_bind_text(stmt, 4, movie?.overview, -1, nil) != SQLITE_OK {
            print("Error binding rank")
        }
        
        if sqlite3_bind_int(stmt, 5, Int32((movie?.vote_average)!)) != SQLITE_OK {
            print("Error binding rank")
        }
        
        if sqlite3_bind_text(stmt, 6, movie?.poster_path, -1, nil) != SQLITE_OK {
            print("Error binding rank")
        }
        
        if sqlite3_bind_text(stmt, 7, movie?.backdrop_path, -1, nil) != SQLITE_OK {
            print("Error binding rank")
        }
        
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            print("Hero saved successfully")
        }
        
    }
    
    
    func readFavoritesTable() {
        //        var stmt: OpaquePointer?
        //        let selectQuery = "SELECT * FROM Movies"
        //
        //        if sqlite3_prepare_v2(db, selectQuery, -1, &stmt, nil) != SQLITE_OK {
        //            print("Error selecting query")
        //        } else {
        //            while sqlite3_step(stmt) == SQLITE_ROW {
        //                let id = sqlite3_column_int(stmt, 0)
        //                let name = String(describing: String(cString: sqlite3_column_text(stmt, 1)))
        //                let powerrank = sqlite3_column_int(stmt, 2)
        //
        //                heroes.append(Hero(name: name, powerrank: Int(powerrank), id: Int(id)))
        //                print("Query result: ")
        //                print("\(id) | \(name) | \(powerrank)")
        //            }
        //        }
        //
        //        sqlite3_finalize(stmt)
        //        return heroes
    }
    
    func deleteFavoriteRow() {
        
    }
    
    
}
