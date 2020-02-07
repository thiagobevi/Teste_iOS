//
//  DetailsViewController.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/30/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    let favoriteServie = FavoritesService()
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailDescLabel.text = movie?.overview
        detailTitleLabel.text = movie?.title
        if let finalURL = movie?.poster_path {
            let resource = URL(string: "https://image.tmdb.org/t/p/w500/\(finalURL)")!
            detailImageView.kf.setImage(with: resource)
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFavorite))
            addButton.title = "Save"
            self.navigationItem.rightBarButtonItem = addButton
    
        }
    }
    
    @objc func addFavorite() {
        guard let movie = movie else { return }
        favoriteServie.addFavoriteMovie(movie: movie)
    }

}
