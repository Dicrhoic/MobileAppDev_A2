//
//  EntreeTableViewCell.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 17/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class EntreeTableViewCell: UITableViewCell {
    //cell used for cleaner code
    @IBOutlet weak var nameAndPrice: UILabel!
    @IBOutlet weak var detail: UILabel!

    static let reuseIdentifier = "EntreeCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
