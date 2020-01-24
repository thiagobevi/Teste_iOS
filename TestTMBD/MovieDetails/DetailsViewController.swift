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
    
        }
        // detailImageView.kf.setImage(with: movie?.poster_path)

    }
    


}
