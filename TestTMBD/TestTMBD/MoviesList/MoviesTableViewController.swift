//
//  MoviesTableViewController.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/23/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    
    var presenter = MoviesListPresenter(service: MoviesListService(), serviceClass: MoviesListService())
    //var movies: [Movie]?
    var movies: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.requestAuth()
        presenter.moviesList()
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "AAAAAw"
        navigationItem.searchController = searchController

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 4
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! Cell
        
        // Configure the cell...
        cell.titlteCell.text = movies?[indexPath.row].title
        cell.idCell.text = "\(movies?[indexPath.row].id ?? 0)"
        cell.releaseCell.text = movies?[indexPath.row].release_date
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetails(movie: (movies?[indexPath.row])!)
    }
}

extension MoviesTableViewController: MoviesListView {
    func searchMovie(text: String) {
        
    }
    
    
    func showDetails(movie: Movie) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showMoviesList(moviesOk: [Movie]) {
        movies = moviesOk
        self.tableView.reloadData()
    }
    
    func requestAuth() {
        print("Ok auth")
    }
    
    func moviesList() {
        print("OK List")
        
    }
    
}

extension MoviesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        presenter.searchMovie(text: text)

    }
    
    
}
