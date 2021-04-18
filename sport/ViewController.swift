//
//  ViewController.swift
//  sport
//
//  Created by mosatafa abdalla on 4/17/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController ,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    var sports:[Sports]=[]
    private let reuseIdentifier = "Cell"
    
    override func viewDidLoad() {
           super.viewDidLoad()
           collection.dataSource=self
           collection.delegate=self
        
            self.collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
           down()
       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cCell", for: indexPath) as! CollectionCell
        cell.txt.text=sports[indexPath.row].strSport
        
       
        cell.img.sd_setImage(with: URL(string: sports[indexPath.row].strSportThumb ?? ""), placeholderImage: UIImage(named: "a.png"))
            
        return cell
        
    }


    @IBOutlet weak var collection: UICollectionView!
    
   

    
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.25)
    }*/
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 175)
       }
    
    
    
    
    func down() {
            let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/all_sports.php")
                  let request = URLRequest(url: url!)
                  let session = URLSession(configuration: .default)
                  
        let _: Void = session.dataTask(with: request) { (data, response, error) in
    do{
       
        let ob = try JSONDecoder().decode(SportsArr.self, from: data!)
        
        DispatchQueue.main.async {
         
            self.sports=ob.sports ?? []
            self.collection.reloadData()
        }

      
                      }catch{
                          print("error")
                      }
                  }.resume()
                  
        }

}

