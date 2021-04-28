//
//  TeamDetialsVC.swift
//  sport
//
//  Created by mosatafa abdalla on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class TeamDetialsVC: UIViewController {
   
    

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var sName: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var sImg: UIImageView!
    
    var idStr:String!
    
    
    let presenter=TeamDetilaPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        presenter.downTeam(id: idStr) { (team,error) in
        
            if error == nil{
            self.name.text = team?.strTeam
            self.sImg.sd_setImage(with: URL(string: (team?.strStadiumThumb) ?? ""), placeholderImage: UIImage(named: "a.png"))
            self.logo.sd_setImage(with: URL(string: (team?.strTeamBadge) ?? ""), placeholderImage: UIImage(named: "a.png"))
            self.sName.text = team?.strStadium}
            else{
            let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                                              alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                                              self.present(alert, animated: true, completion: nil)
                           }
        }
        /* }else{
                       let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                                      alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                                      self.present(alert, animated: true, completion: nil)
                   }*/

        sImg.contentMode = .scaleAspectFill
        sImg.layer.borderWidth = 1.0
        sImg.layer.masksToBounds = false
        sImg.layer.borderColor = UIColor.white.cgColor
        sImg.layer.cornerRadius = sImg.frame.size.width / 2
        sImg.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
