//
//  FavTableViewCell.swift
//  sport
//
//  Created by Aya on 4/26/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var favimg: UIImageView!
    
    @IBAction func favYT(_ sender: Any) {
    }
    
    @IBOutlet weak var favTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
