//
//  DetialsPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/19/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation

class DetialsPresenter{

let network = NetworkManager()
let  core = CoreDat()
 func downTeams(country:String,sport:String,com :@escaping ([Teams], String?) -> Void){
    network.downTeams(country: country, sport: sport, com: com)
 }

 func downResult(id:String,com :@escaping ([Events],String?) -> Void){
    network.downResult(id: id, com: com)

 }
    
 func downUpComing(id:String,com :@escaping ([Events],String?) -> Void){
    network.downUpComing(id: id, com: com)
 }
    
}
