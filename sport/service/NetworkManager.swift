//
//  NetworkManager.swift
//  sport
//
//  Created by mosatafa abdalla on 4/21/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation


class NetworkManager {
    
    
    func downTeam(id:String,com : @escaping (Teams?, String?) -> Void ){
            
            let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id=\(id)")
                           let request = URLRequest(url: url!)
                           let session = URLSession(configuration: .default)
                           
                 let _: Void = session.dataTask(with: request) { (data, response, error) in
             do{
                
                 let ob = try JSONDecoder().decode(TeamsArr.self, from: data ?? Data())
                 
                 DispatchQueue.main.async {
                   com((ob.teams?[0])!,nil)
                 }
                
             }catch{
                com(nil,"Error")
                 print("error")

                }}.resume()
        }
    
    
    func loadSports(com :@escaping ([Sports],String?) -> Void) {
            let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/all_sports.php")
                  let request = URLRequest(url: url!)
                  let session = URLSession(configuration: .default)
                  
        let _: Void = session.dataTask(with: request) { (data, response, error) in
    do{
       
        let ob = try JSONDecoder().decode(SportsArr.self, from: data ?? Data())
        
        DispatchQueue.main.async {
         
            
            com(ob.sports!,nil)
            
        }
        
    }catch{
        DispatchQueue.main.async {
                        com([],"error")
                        print("error")
                        }
                      }
                  }.resume()
                  
        }
    
    
    
func loadLeagues(sport : String ,com :@escaping ([Countrys],String?) -> Void) {
        
       let str = sport.replacingOccurrences(of: " ", with: "_")

       let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=\(str)")
                  let request = URLRequest(url: url!)
                  let session = URLSession(configuration: .default)
                  
        let _: Void = session.dataTask(with: request) { (data, response, error) in
    do{
        let ob = try JSONDecoder().decode(CountrysArr.self, from: data ?? Data() )
        DispatchQueue.main.async {
            
            com(ob.countrys!, nil)
        }
        }
        /**/
    catch{
        DispatchQueue.main.async {
        com([],"error")
        print("")  }
            }}.resume()
        
        
    }
    
    //*****************Leagues Detials*********************//
    func downTeams(country:String,sport:String,com :@escaping ([Teams],String?) -> Void){
         
let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=\(sport ?? "")&c=\(country ?? "")") ?? URL(string:"https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=Soccer&c=England")
        let request = URLRequest(url: url!)
                        let session = URLSession(configuration: .default)
                        
              let _: Void = session.dataTask(with: request) { (data, response, error) in
          do{
             
              let ob = try JSONDecoder().decode(TeamsArr.self, from: data ?? Data())
              
              DispatchQueue.main.async {
                com(ob.teams ?? [],nil)
              }
         }catch{
             DispatchQueue.main.async {
                   com([],"error")
                   print("")  }
         }
     }.resume()
     }
     
     
     
    func downResult(id :String,com :@escaping ([Events], String?) -> Void){
         
         let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(id)")
                        let request = URLRequest(url: url!)
                        let session = URLSession(configuration: .default)
                        
              let _: Void = session.dataTask(with: request) { (data, response, error) in
          do{
             
              let ob = try JSONDecoder().decode(EventsArr.self, from: data ?? Data())
              
              DispatchQueue.main.async {
                com(ob.events ?? [],nil)
              }
         }catch{
           DispatchQueue.main.async {
                  com([],"error")
                  print("")  }
         }
        }.resume()
     }
     

    func downUpComing(id:String,com :@escaping ([Events],String?) -> Void){
            
            let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=\(id)&r=33&s=2020-2021")
                           let request = URLRequest(url: url!)
                           let session = URLSession(configuration: .default)
                           
                 let _: Void = session.dataTask(with: request) { (data, response, error) in
             do{
                
                 let ob = try JSONDecoder().decode(EventsArr.self, from: data ?? Data())
                 
                 DispatchQueue.main.async {
                    com(ob.events ?? [],nil)
                 }
                               }catch{
                                  DispatchQueue.main.async {
                                          com([],"error")
                                          print("")  }
                               }
                           }.resume()
       
        }
    
}
