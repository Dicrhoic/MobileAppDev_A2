//
//  AdminEntreeTableViewCell.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 20/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class AdminEntreeTableViewCell: UITableViewCell {
    
   
    
    @IBOutlet weak var entreeDish: UILabel!
     static let reuseIdentifier = "AdminEntreeCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
