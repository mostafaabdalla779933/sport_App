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
    let presenter = SportPresenter()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        collection.dataSource=self
        collection.delegate=self
        
       self.collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    
        presenter.loadSports{ (sportsArr) in
            
            self.sports=sportsArr
            self.collection.reloadData()
            
        }
 

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        let num = collection.indexPathsForSelectedItems
        if(segue.identifier=="showLeagues"){
        let vc = segue.destination as! LeaguesViewController
            vc.sport = sports[(num?[0].row)!].strSport
        }
    }
    @IBOutlet weak var collection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.25)
        return CGSize(width: 200, height: 175)
    }
}

