//
//  Favourit.swift
//  sport
//
//  Created by mosatafa abdalla on 4/23/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation

class Favourit{
    var idLeague:String=""
    var strBadge:String=""
    var strSport:String=""
    var strLeague:String=""
    var strYoutube:String=""
    var country:String=""
    
    init(idLeague:String,strBadge:String,strSport:String,strLeague:String,strYoutube:String,country:String){
        
        self.idLeague = idLeague
        self.strSport = strSport
        self.strBadge = strBadge
        self.strYoutube = strYoutube
        self.strLeague = strLeague
        self.country = country
    }
    
}
