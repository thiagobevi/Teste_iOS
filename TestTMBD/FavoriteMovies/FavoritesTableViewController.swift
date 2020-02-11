//
//  FavoritesTableViewController.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/5/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import UIKit
import Kingfisher
import Kingfisher

class FavoritesTableViewController: UITableViewController {
    
    var presenter: FavoritesPresenter?
    var favoriteMovies: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.atachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.fetchFavoriteMovies()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteMovies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell2") as! FavoriteCell
        cell.favoriteTitle.text = favoriteMovies?[indexPath.row].title
        cell.favoriteReleaseDate.text = favoriteMovies?[indexPath.row].release_date
        
        if let finalURL = favoriteMovies?[indexPath.row].poster_path {
            let resource = URL(string: "https://image.tmdb.org/t/p/w154/\(finalURL)")!
            cell.imageView?.kf.setImage(with: resource)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.favoriteMovies?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            presenter?.deleteMovie(id: (favoriteMovies[indexPath.row]))
        }
    }
    
}

extension FavoritesTableViewController: FavoritesView {

    func showFavoriteMovies(_ movies: [Movie]) {
        favoriteMovies = movies
        tableView.reloadData()
    }
    
}
