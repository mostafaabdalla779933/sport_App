//
//  LeaguesTableViewCell.swift
//  sport
//
//  Created by Aya on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    
    
    var strYoutube:String!
    @IBOutlet weak var leaguesImg: UIImageView!
    
    @IBAction func btnYtube(_ sender: Any) {
        
       print("http://\(strYoutube!)")
        
        if let url = URL(string: "http://\(strYoutube ?? "www.youtube.com")") {
            if #available(iOS 10, *){
                UIApplication.shared.open(url,completionHandler: {sucss in
                    if sucss {
                        print("success")
                    }else{
                        print("faild")
                    }
                })
            }else{
                UIApplication.shared.openURL(url)
            }
        }else{
            print("not valid")
        }
        
        
        
    }
    
    @IBOutlet weak var leaguesTitle: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
