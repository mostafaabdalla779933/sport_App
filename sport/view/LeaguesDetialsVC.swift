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
            self.CResults.reloadData()
        }
        prsenter.downUpComing (id :id){ (events) in
            self.upComeArr=events
            self.CEvent.reloadData()
        }
       
        prsenter.downTeams(country: country, sport: sport) { (teams) in
            self.teamsArr=teams
            self.CTeams.reloadData()
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
                  
                       
                   return cell
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
           //return CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.25)
        
        
        if collectionView == self.CEvent {
           return CGSize(width: 400, height: 125)
        }else if collectionView == self.CTeams {
            return CGSize(width: 206, height: 242)
            
        }else{
            
          return CGSize(width: 400, height: 160)
            
            
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
    
    


       
}
