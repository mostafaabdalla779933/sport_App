//
//  LeaguesViewController.swift
//  sport
//
//  Created by Aya on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController, LeaguesProtocol {
  
    func setLeagues(CountrysArr: [Countrys]) {
         self.countrys = CountrysArr
         self.leaguesview.reloadData()
    }
    

    @IBOutlet weak var leaguesview: UITableView!
   // let leagues = ["Ah","zam","Rl","Le"]
    var countrys:[Countrys]=[]
    let presenter = LeaguesPresenter()
    var sport :String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(view: self)
        leaguesview.delegate = self
        leaguesview.dataSource = self
        presenter.loadLeagues(sport: sport)
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


// MARK: -Extension

extension LeaguesViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print(indexPath.row)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetial") as! LeaguesDetialsVC
        
        vc.modalPresentationStyle = .fullScreen
        vc.sport=countrys[indexPath.row].strSport
        vc.country=countrys[indexPath.row].strCountry
        
        self.present(vc, animated: true, completion: nil)
    }
   
   /* func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }*/
    

    
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(countrys.count)
        return countrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create cell
        let cell = leaguesview.dequeueReusableCell(withIdentifier: "customCell") as! LeaguesTableViewCell
       //cell.leaguesImg.layer.cornerRadius = cell.leaguesImg.frame.size.width/2.0
       
        cell.leaguesImg.layer.borderWidth = 1.0
        cell.leaguesImg.layer.masksToBounds = false
        cell.leaguesImg.layer.borderColor = UIColor.white.cgColor
        cell.leaguesImg.layer.cornerRadius = cell.leaguesImg.frame.size.width / 2
        cell.leaguesImg.clipsToBounds = true
        
         cell.leaguesImg.contentMode = .scaleAspectFit
        cell.leaguesTitle.text = countrys[indexPath.row].strLeague
        cell.leaguesImg.sd_setImage(with: URL(string: countrys[indexPath.row].strBadge ?? ""), placeholderImage: UIImage(named: "exo.png"))
        
        //   cell.leaguesImg.image = UIImage(named: "exo.png")
        // cell.leaguesTitle.text = leage
        
        return cell
    }
    
    

    
}



