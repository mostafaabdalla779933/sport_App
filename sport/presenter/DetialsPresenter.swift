//
//  DetialsPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation

class DetialsPresenter{
    
    var view:DetialsProtocol!
    
    func attach(view:DetialsProtocol){
        
        self.view=view
        
    }
    
    func downTeams(){
         
         let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=Soccer&c=england")
                        let request = URLRequest(url: url!)
                        let session = URLSession(configuration: .default)
                        
              let _: Void = session.dataTask(with: request) { (data, response, error) in
          do{
             
              let ob = try JSONDecoder().decode(TeamsArr.self, from: data!)
              
              DispatchQueue.main.async {
               
                self.view.setTeams(teams: ob.teams ?? [])
             
                  
                  
              }

            
                            }catch{
                                print("error")
                            }
                        }.resume()
         
         
         
         
         
     }
     
     
     
     func downResult(){
         
         let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=4328")
                        let request = URLRequest(url: url!)
                        let session = URLSession(configuration: .default)
                        
              let _: Void = session.dataTask(with: request) { (data, response, error) in
          do{
             
              let ob = try JSONDecoder().decode(EventsArr.self, from: data!)
              
              DispatchQueue.main.async {
               
                self.view.setResults(results: ob.events ?? [] )
                 // self.view.setSports(sportsArr: ob.sports!)
                  
                  
              }

            
                            }catch{
                                print("error")
                            }
                        }.resume()
    
     }
     

     func downUpComing(){
            
            let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=4328&r=33&s=2020-2021")
                           let request = URLRequest(url: url!)
                           let session = URLSession(configuration: .default)
                           
                 let _: Void = session.dataTask(with: request) { (data, response, error) in
             do{
                
                 let ob = try JSONDecoder().decode(EventsArr.self, from: data!)
                 
                 DispatchQueue.main.async {
                  
                    self.view.setEvents(events: ob.events ?? [])
                    // self.view.setSports(sportsArr: ob.sports!)
                     
                     
                 }

               
                               }catch{
                                   print("error")
                               }
                           }.resume()
       
        }
    
    
}
