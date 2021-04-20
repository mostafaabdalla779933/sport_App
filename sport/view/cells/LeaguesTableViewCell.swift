//
//  LeaguesTableViewCell.swift
//  sport
//
//  Created by Aya on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var leaguesImg: UIImageView!
    @IBOutlet weak var leaguesYtubeBtn: UIButton!
    @IBOutlet weak var leaguesTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
