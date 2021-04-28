//
//  LeaguesDetialsVC.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class LeaguesDetialsVC: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var CEvent: UICollectionView!
    
    @IBOutlet weak var CResults: UICollectionView!
    
    @IBOutlet weak var CTeams: UICollectionView!
    
    
    
    var teamsArr:[Teams]=[]
    var reaultsArr:[Events]=[]
    var upComeArr:[Events]=[]
    var prsenter=DetialsPresenter()
    var sport:String!
    var country:String!
    var badge:String!
    var youtube:String!
    var league:String!
    var id :String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CResults.delegate=self
        CResults.dataSource=self
        CTeams.delegate=self
        CTeams.dataSource=self
        CEvent.delegate=self
        CEvent.dataSource=self
        prsenter.downResult(id: id) { (results) in
            self.reaultsArr=results
                self.CResults.reloadData()}else{
                let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                               alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                               self.present(alert, animated: true, completion: nil)
            }
        }
        prsenter.downUpComing (id :id){ (events, error) in
           
            if error == nil{
            self.upComeArr=events
            self.CEvent.reloadData()
                
            }else{
                let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                               alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                               self.present(alert, animated: true, completion: nil)
            }
        }
       
        prsenter.downTeams(country: country, sport: sport) { (teams, error) in
            if error == nil {
            self.teamsArr=teams
                self.CTeams.reloadData()}
            else{
                let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
                               alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
                               self.present(alert, animated: true, completion: nil)
            }
        }
    }

    
    @IBAction func addFav(_ sender: Any) {
        
       let f=Favourit(idLeague: id, strBadge: badge, strSport: sport, strLeague: league, strYoutube: youtube,country: country)
        
        if prsenter.isFavAdded(id: f.idLeague) {
            let alert = UIAlertController(title: "", message: "already add", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            
            prsenter.addFav(fav: f)
        }     
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.CEvent {
            return upComeArr.count
        }else if collectionView == self.CTeams {
            return teamsArr.count
        }else{
            return reaultsArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
      if collectionView == self.CEvent {
            
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eCell", for: indexPath) as! EventCell
        cell.home.text = upComeArr[indexPath.row].strHomeTeam
        cell.away.text = upComeArr[indexPath.row].strAwayTeam
        cell.date.text=upComeArr[indexPath.row].dateEvent
        cell.time.text=upComeArr[indexPath.row].strTime
        cell.contentView.layer.cornerRadius = 40
        cell.contentView.layer.borderWidth = 5.0

        cell.contentView.layer.borderColor = hexStringToUIColor(hex: "#3b5998").cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = hexStringToUIColor(hex: "#3b5998").cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        return cell
        }else if collectionView == self.CTeams {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tCell", for: indexPath) as! TeamCell
            cell.txt.text=teamsArr[indexPath.row].strTeam
            cell.img.sd_setImage(with: URL(string: teamsArr[indexPath.row].strTeamBadge ?? ""), placeholderImage: UIImage(named: "a.png"))
    
        
        cell.img.contentMode = .scaleAspectFit
        cell.img.layer.borderWidth = 1.0
        cell.img.layer.masksToBounds = false
        cell.img.layer.borderColor = UIColor.white.cgColor
        cell.img.layer.cornerRadius = cell.img.frame.size.width / 2
        cell.img.clipsToBounds = true
       
        
        
                   return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rCell", for: indexPath) as! ResultCell
            cell.away.text=reaultsArr[indexPath.row].strAwayTeam
            cell.home.text=reaultsArr[indexPath.row].strHomeTeam
            cell.result.text = "\(reaultsArr[indexPath.row].intHomeScore?.description ?? "0")-\(reaultsArr[indexPath.row].intAwayScore?.description ?? "0")"
            cell.Date.text=reaultsArr[indexPath.row].dateEvent
            cell.time.text=reaultsArr[indexPath.row].strTime
            cell.contentView.layer.cornerRadius = 45
            cell.contentView.layer.borderWidth = 5.0
        
       /* #3b5998
        #8b9dc3
        #dfe3ee
        #f7f7f7
        #ffffff*/
        cell.contentView.layer.borderColor = hexStringToUIColor(hex: "#dfe3ee").cgColor
            
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = hexStringToUIColor(hex: "#dfe3ee").cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds,
                    cornerRadius:cell.contentView.layer.cornerRadius).cgPath
          return cell
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
           //return CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.25)
        
        
        if collectionView == self.CEvent {
            return CGSize(width:  UIScreen.main.bounds.width - 5, height: self.CEvent.bounds.height - 5)
        }else if collectionView == self.CTeams {
            return CGSize(width:  (UIScreen.main.bounds.width / 2) - 5, height: self.CTeams.bounds.height - 5)
            
        }else{
            
          return CGSize(width:  UIScreen.main.bounds.width - 50, height: self.CResults.bounds.height - 5)
            
            
        }
        
}
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let num = CTeams.indexPathsForSelectedItems
        
        if(segue.identifier=="show"){
        let vc: TeamDetialsVC=segue.destination as! TeamDetialsVC
            print(teamsArr[(num?[0].row)!].strTeam)
            vc.idStr=teamsArr[(num?[0].row)!].idTeam

        }
    
        
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
