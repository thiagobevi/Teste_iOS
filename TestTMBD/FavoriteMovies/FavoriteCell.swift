//
//  FavoviteCell.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 2/10/20.
//  Copyright © 2020 Thiago Bevilacqua. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteTitle: UILabel!
    @IBOutlet weak var favoriteID: UILabel!
    @IBOutlet weak var favoriteReleaseDate: UILabel!
    @IBOutlet weak var favoriteVote: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .green
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
