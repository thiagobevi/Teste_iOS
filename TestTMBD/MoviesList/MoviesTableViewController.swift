//
//  MoviesTableViewController.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/23/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit
import Kingfisher
class MoviesTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchController: UISearchController?
    var presenter: MoviesListPresenter?
    var movies: [Movie] = []
    var moviesSearch: [Movie] = []
    var isTopMovie = true
    var i = 2
    var text = ""
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MoviesListPresenter(service: MoviesListService())
        configureSearchController()
        presenter?.moviesList(page: 1)
        presenter?.atatchView(view: self)
    }
    
    // MARK: IBActions
    
    @IBAction func loadNextMovies(_ sender: Any) {
        
        if isTopMovie == true {
            presenter?.moviesList(page: i)
            i+=1
            tableView.reloadData()
        } else {
            
            presenter?.searchMovie(text: text , page: i)
            i+=1
            tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension MoviesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! Cell
        if let finalURL = movies[indexPath.row].backdrop_path {
            let resource = URL(string: "https://image.tmdb.org/t/p/w154/\(finalURL)")!
            cell.imageCell?.kf.indicatorType = .activity
            cell.imageCell?.kf.setImage(with: resource)
        }
        
        // Configure the cell...
        cell.titlteCell.text = movies[indexPath.row].title
        cell.idCell.text = "\(movies[indexPath.row].id ?? 0)"
        cell.releaseCell.text = movies[indexPath.row].release_date
        cell.voteCell.text = "\(movies[indexPath.row].vote_average ?? 0)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        presenter?.didSelectMovie(movie: movie)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Most Popular Movies"
    }
    
}

extension MoviesTableViewController: MoviesListView {
    func attachView(view: MoviesListView) {
        
    }
    
    
    func showSearchMovie(searchedMovie: [Movie]) {
        movies.append(contentsOf: searchedMovie)
        self.tableView.reloadData()
    }
    
    
    func searchMovie(text: String) {
    }
    
    func showDetails(movie: Movie) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
        //print(movie)
        
    }
    
    func showMoviesList(moviesOk: [Movie]) {
        movies.append(contentsOf: moviesOk)
        self.tableView.reloadData()
    }
    
    func requestAuth() {
        print("Ok auth")
    }
    
    func moviesList() {
        print("OK List")
    }
    
}

extension MoviesTableViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "AAAAAw"
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        movies.removeAll()
        isTopMovie = false
        self.text = searchBar.text!
        presenter?.searchMovie(text: text, page: 1)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movies.removeAll()
        presenter?.moviesList(page: 1)
        tableView.reloadData()
    }
}


