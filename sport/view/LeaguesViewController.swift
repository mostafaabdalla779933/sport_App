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
        print(countrys[indexPath.row].strSport)
        print(countrys[indexPath.row].strCountry)
        vc.country=countrys[indexPath.row].strCountry
        vc.badge=countrys[indexPath.row].strBadge
        vc.youtube=countrys[indexPath.row].strYoutube
        vc.league=countrys[indexPath.row].strLeague
        vc.id=countrys[indexPath.row].idLeague
        //self.navigationController?.pushViewController(vc, animated: true)
        
        self.present(vc, animated: true)

        
    }
   

   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(countrys.count)
        return countrys.count
    }
    
   /* override func viewDidLayoutSubviews() {
         contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesview.dequeueReusableCell(withIdentifier: "customCell") as! LeaguesTableViewCell

       // cell.contentView.frame = cell.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        cell.leaguesImg.layer.borderWidth = 1.0
        cell.leaguesImg.layer.masksToBounds = false
        cell.leaguesImg.layer.borderColor = UIColor.white.cgColor
        cell.leaguesImg.layer.cornerRadius =
            cell.leaguesImg.frame.size.width / 2
        cell.leaguesImg.clipsToBounds = true
        
         cell.leaguesImg.contentMode = .scaleAspectFit
        
        
        cell.strYoutube = countrys[indexPath.row].strYoutube
        cell.leaguesTitle.text = countrys[indexPath.row].strLeague
        
        cell.leaguesImg.sd_setImage(with: URL(string: countrys[indexPath.row].strBadge ?? ""), placeholderImage: UIImage(named: "a.png"))
        
        cell.contentView.layer.cornerRadius = 45
        cell.contentView.layer.borderWidth = 5.0
        cell.contentView.layer.borderColor = hexStringToUIColor(hex: "#3b5998").cgColor
        //cell?.backgroundColor = hexStringToUIColor(hex: "#3b5998").cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = hexStringToUIColor(hex: "#3b5998").cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds,
                          cornerRadius:cell.contentView.layer.cornerRadius).cgPath

        return cell
    }
    
    

    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
}



