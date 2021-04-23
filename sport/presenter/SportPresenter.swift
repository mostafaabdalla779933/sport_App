//
//  SportPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
class SportPresenter {
    
    let network=NetworkManager()
    func loadSports(com :@escaping ([Sports]) -> Void) {
        network.loadSports(com: com)
    }
}
