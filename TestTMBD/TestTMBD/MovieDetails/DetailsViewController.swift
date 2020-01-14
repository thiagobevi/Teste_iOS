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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailDescLabel.text = movie?.overview
        detailTitleLabel.text = movie?.title

    }
    


}
