//
//  SportsArr.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//



import Foundation
struct SportsArr : Codable {
    let sports : [Sports]?

    enum CodingKeys: String, CodingKey {

        case sports = "sports"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sports = try values.decodeIfPresent([Sports].self, forKey: .sports)
    }

}


