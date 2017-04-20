//
//  RecipeDetailViewCell.swift
//  MisRecetas
//
//  Created by Cristian Fernández on 26/03/2017.
//  Copyright © 2017 Cristian Fernández. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    var recipe : Recipe!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
