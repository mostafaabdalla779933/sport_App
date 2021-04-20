//
//  TeamDetilaPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation


class TeamDetilaPresenter {
    
    var view:TeamDetialProtocol!
    
    func attach(view:TeamDetialProtocol){
        
        self.view=view
        
    }
    
    
    func downTeam(id:String){
         
         let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=\(id)")
                        let request = URLRequest(url: url!)
                        let session = URLSession(configuration: .default)
                        
              let _: Void = session.dataTask(with: request) { (data, response, error) in
          do{
             
              let ob = try JSONDecoder().decode(TeamsArr.self, from: data!)
              
              DispatchQueue.main.async {
                let team=ob.teams?[0]
              
                self.view.setTeams(teams: (ob.teams?[0])! )
                 
                  
                  
              }

            
                            }catch{
                                print("error")
                            }
                        }.resume()
    
     }
    
    
}
