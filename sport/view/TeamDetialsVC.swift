//
//  TeamDetialsVC.swift
//  sport
//
//  Created by mosatafa abdalla on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class TeamDetialsVC: UIViewController ,TeamDetialProtocol {
   
    

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var sName: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var sImg: UIImageView!
    
    var idStr:String!
    let presenter=TeamDetilaPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attach(view: self)
        presenter.downTeam(id: idStr)
        
    //    let image = UIImage(named: "imageName")
        
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
    
    
    
     

    
    func setTeams(teams: Teams) {
        self.name.text = teams.strTeam
        self.sImg.sd_setImage(with: URL(string: (teams.strStadiumThumb) ?? ""), placeholderImage: UIImage(named: "a.png"))
        self.logo.sd_setImage(with: URL(string: (teams.strTeamBadge) ?? ""), placeholderImage: UIImage(named: "a.png"))
        self.sName.text = teams.strStadium
    }
}
