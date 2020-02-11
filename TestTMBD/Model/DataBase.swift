//
//  DataBase.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/10/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import Foundation
import SQLite3
import SQLite

protocol DatabaseProtocol {
    func openDatabase()
    func loadDatabase() -> [Movie]
    func insertMovie(movie: Movie)
    func deleteMovie(idMovie: Int64)
}

        // MARK: - SQLite.Swift

class Database: DatabaseProtocol {
    
    var db: OpaquePointer?
    let moviesTable = Table("Movies")
    static let shared = Database()
    private init () {}
    
    let id = Expression<Int64>("id")
    let title = Expression<String>("title")
    let idTMDB = Expression<Int64>("idTMDB")
    let release_date = Expression<String>("release_date")
    let overview = Expression<String>("overview")
    let vote_average = Expression<Double>("vote_average")
    let poster_path = Expression<String>("poster_path")
    let backdrop_path = Expression<String>("backdrop_path")
    
    func openDatabase() {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbs = try! Connection("\(path)/Movies.sqlite3")
        
        do {
            try dbs.run(moviesTable.create(ifNotExists: true) { t in
                t.column(id, primaryKey: true)
                t.column(title)
                t.column(idTMDB, unique: true)
                t.column(release_date)
                t.column(overview)
                t.column(vote_average)
                t.column(poster_path)
                t.column(backdrop_path)
            })
        } catch let error {
            print("Fail to create table \(error)")
        }
    }
    
    func loadDatabase() -> [Movie] {
        var favoriteMovies: [Movie] = []
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbs = try! Connection("\(path)/Movies.sqlite3")
        
        for t in try! dbs.prepare(moviesTable) {
            do {
                
                favoriteMovies.append(Movie(title: try? t.get(title), id: try t.get(idTMDB), release_date: try? t.get(release_date), overview: try t.get(overview), vote_average: try t.get(vote_average), poster_path: try t.get(poster_path), backdrop_path: try t.get(backdrop_path)))
                print("Movie append succesfully into favoriteMovies, can show it in a view")
            } catch {
                print(error)
            }
        }
        
        return favoriteMovies
    }
    
    func insertMovie(movie: Movie) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbs = try! Connection("\(path)/Movies.sqlite3")
        
        do {
            try dbs.run(moviesTable.insert(title <- movie.title!, idTMDB <- movie.id!, release_date <- movie.release_date!, overview <- movie.overview!, vote_average <- movie.vote_average!, poster_path <- movie.poster_path!, backdrop_path <- movie.backdrop_path!))
        } catch {
            print(error)
        }
        
    }
    
    func deleteMovie(idMovie: Int64) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbs = try! Connection("\(path)/Movies.sqlite3")
        let moviesToDelete = moviesTable.filter(id == idMovie)
        do {
            try dbs.run(moviesToDelete.delete())
        } catch {
            print(error)
        }
    }
    
}



