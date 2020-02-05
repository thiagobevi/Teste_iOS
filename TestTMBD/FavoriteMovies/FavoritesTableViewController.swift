//
//  FavoritesTableViewController.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/5/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import UIKit
import Kingfisher

class FavoritesTableViewController: UITableViewController {

    var presenter: FavoritesPresenter?
    var favoriteMovies: [Movie]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.atachView(view: self)
        presenter?.loadFavoriteMovies()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

  
}


extension FavoritesTableViewController: FavoritesView {
    
    func attachView(view: FavoritesView) {
        
    }
    
    func loadFavorites() {
        favoriteMovies = presenter?.loadFavoriteMovies()
    }
    
    func deleteFavorite(id: Int) {
        presenter?.deleteMovie(id: id)
    }
    
    
}
