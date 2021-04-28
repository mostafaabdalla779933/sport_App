//
//  LeaguesViewController.swift
//  sport
//
//  Created by Aya on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController {
    

    @IBOutlet weak var leaguesview: UITableView!
    var countrys:[Countrys]=[]
    let presenter = LeaguesPresenter()
    var sport :String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaguesview.delegate = self
        leaguesview.dataSource = self
        
    /* presenter.loadSports{ (sportsArr,error) in
               
               if error == nil{
               self.sports=sportsArr
               self.collection.reloadData()
               }else{
                   let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                   alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
                   
               }
               
           }**/
        
        
        presenter.loadLeagues(sport: sport) { (CountrysArr, error) in
            
            if error == nil {
                self.countrys = CountrysArr
                self.leaguesview.reloadData()
            }
            else{
                let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

    
       
    
    // MARK: - Navigation
/*
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
        vc.badge=countrys[indexPath.row].strBadge
        vc.youtube=countrys[indexPath.row].strYoutube
        vc.league=countrys[indexPath.row].strLeague
        vc.id=countrys[indexPath.row].idLeague
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
   

   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(countrys.count)
        return countrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesview.dequeueReusableCell(withIdentifier: "customCell") as! LeaguesTableViewCell

       
        cell.leaguesImg.layer.borderWidth = 1.0
        cell.leaguesImg.layer.masksToBounds = false
        cell.leaguesImg.layer.borderColor = UIColor.white.cgColor
        cell.leaguesImg.layer.cornerRadius =
            cell.leaguesImg.frame.size.width / 2
        cell.leaguesImg.clipsToBounds = true
        
         cell.leaguesImg.contentMode = .scaleAspectFit
        
        
        cell.strYoutube = countrys[indexPath.row].strYoutube
        cell.leaguesTitle.text = countrys[indexPath.row].strLeague
        print(countrys[indexPath.row].idLeague as Any)
        cell.leaguesImg.sd_setImage(with: URL(string: countrys[indexPath.row].strBadge ?? ""), placeholderImage: UIImage(named: "exo.png"))

        return cell
    }
    
    

    
}



