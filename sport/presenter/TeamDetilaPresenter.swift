//
//  TeamDetilaPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation


class TeamDetilaPresenter {

    var network=NetworkManager()
    
    func downTeam(id:String,com : @escaping (Teams?, String?) -> Void ){
        network.downTeam(id: id, com: com)
    }
}
