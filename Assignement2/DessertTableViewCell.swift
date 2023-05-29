//
//  DessertTableViewCell.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 20/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class DessertTableViewCell: UITableViewCell {

    static let reuseIdentifier = "DessertCell"
    
    @IBOutlet weak var desertDetail: UILabel!
    @IBOutlet weak var desertName: UILabel!
    @IBOutlet weak var adminDessert: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
