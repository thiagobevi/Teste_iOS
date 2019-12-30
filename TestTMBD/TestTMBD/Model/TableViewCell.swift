//
//  TableViewCell.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/26/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    
    @IBOutlet weak var titlteCell: UILabel!
    @IBOutlet weak var idCell: UILabel!
    @IBOutlet weak var releaseCell: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
