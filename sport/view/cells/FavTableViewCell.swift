//
//  FavTableViewCell.swift
//  sport
//
//  Created by Aya on 4/26/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    var strYoutube:String!
    @IBOutlet weak var favimg: UIImageView!
    @IBAction func favYT(_ sender: Any) {
       // print(strYoutube)
       //  UIApplication.shared.openURL(NSURL(string: strYoutube!)! as URL)
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

       // UIApplication.shared.openURL(NSURL(string: strYoutube ?? "www.youtube.com/channel/UCJmCVoUfCBQb9lcfXIS8nXQ" )! as URL)
    }
    @IBOutlet weak var favTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
