
//
//  LeaguesArr.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation

import Foundation
struct LeaguesArr : Codable {
    let leagues : [Leagues]?

    enum CodingKeys: String, CodingKey {

        case leagues = "leagues"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        leagues = try values.decodeIfPresent([Leagues].self, forKey: .leagues)
    }

}
