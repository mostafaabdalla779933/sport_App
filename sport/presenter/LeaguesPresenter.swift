//
//  LeaguesPresenter.swift
//  sport
//
//  Created by Aya on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
class LeaguesPresenter {
    
    var view:LeaguesProtocol! = nil
    
    func attach(view:LeaguesProtocol) {
        self.view = view
    }
    
   //URL ="https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=England&s=Soccer"
    
    func loadLeagues(sport : String?) {
        let url = URL(string:"https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=\(sport ?? "")")
                  let request = URLRequest(url: url!)
                  let session = URLSession(configuration: .default)
                  
        let _: Void = session.dataTask(with: request) { (data, response, error) in
    do{
        let ob = try JSONDecoder().decode(CountrysArr.self, from: data!)
        DispatchQueue.main.async {
           self.view.setLeagues(CountrysArr: ob.countrys!)
            print(ob.countrys!.count)
        }
        }
    catch{  print(error.localizedDescription)  }
        }.resume()}}
        
