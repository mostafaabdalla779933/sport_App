//
//  FavViewController.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import UIKit

class FavViewController: UIViewController {

    var core=CoreDat()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        var data=core.get()
        
        
        for i in data {
          print(i.strLeague)
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

}
