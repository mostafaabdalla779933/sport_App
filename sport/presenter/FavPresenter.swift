//
//  FavPresenter.swift
//  sport
//
//  Created by mosatafa abdalla on 4/28/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
class FavPresenter {
    
    var core = CoreDat()

    func loadFav() -> [Favourit]{
       return core.get()
    }
}
