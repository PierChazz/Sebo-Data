//
//  TableViewCell.swift
//  SeboData
//
//  Created by Pierre pc. CHARVOZ on 23/11/2016.
//  Copyright © 2016 Pierre pc. CHARVOZ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titreCell: UILabel!
    

    @IBOutlet weak var descCell: UILabel!
   
    
        
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
