//
//  SportPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
class SportPresenter {
    
    var view: SportsProtocol! = nil
    
    func attach(view:SportsProtocol) {
        self.view=view
    }
    
   
    
    func loadSports() {
            let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/all_sports.php")
                  let request = URLRequest(url: url!)
                  let session = URLSession(configuration: .default)
                  
        let _: Void = session.dataTask(with: request) { (data, response, error) in
    do{
       
        let ob = try JSONDecoder().decode(SportsArr.self, from: data!)
        
        DispatchQueue.main.async {
         
            self.view.setSports(sportsArr: ob.sports!)
            
            
        }

      
                      }catch{
                          print("error")
                      }
                  }.resume()
                  
        }
    
}
