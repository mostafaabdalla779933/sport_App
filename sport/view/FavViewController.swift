//
//  FavViewController.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit
import SDWebImage

class FavViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var fav:[Favourit] = []
    let presenter = FavPresenter()
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        fav = presenter.loadFav()
        table.reloadData()
        if  NetworkMonitor.shared.isConnected{
            print("Connected")
        }else {
            print("Disconnected")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Fcell") as? FavTableViewCell

        cell?.favTitle.text = fav[indexPath.row].strLeague
    
        cell?.strYoutube = fav[indexPath.row].strYoutube
        print(fav[indexPath.row].strYoutube)
        cell?.favimg.sd_setImage(with: URL(string: fav[indexPath.row].strBadge ), placeholderImage: UIImage(named: "exo.png"))
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 340
      }
   
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              print(indexPath.row)
             
        if NetworkMonitor.shared.isConnected{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesDetial") as! LeaguesDetialsVC
                        
                        vc.modalPresentationStyle = .fullScreen
                        vc.sport=fav[indexPath.row].strSport
                        vc.country = fav[indexPath.row].country
                        vc.badge=fav[indexPath.row].strBadge
                        vc.youtube=fav[indexPath.row].strYoutube
                        vc.league=fav[indexPath.row].strLeague
                        vc.id=fav[indexPath.row].idLeague
                        self.navigationController?.pushViewController(vc, animated: true)
            
            
        }else{
            
            let alert = UIAlertController(title: "warring", message: "no internet connection", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }      
      }

}
