//
//  LeaguesPresenter.swift
//  sport
//
//  Created by Aya on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
class LeaguesPresenter {
    
    var network=NetworkManager()

    func loadLeagues(sport : String,com :@escaping ([Countrys]) -> Void){
        network.loadLeagues(sport: sport, com: com)
    }
}
        
