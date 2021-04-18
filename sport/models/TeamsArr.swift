//
//  TeamsArr.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//


import Foundation
struct TeamsArr : Codable {
    let teams : [Teams]?

    enum CodingKeys: String, CodingKey {

        case teams = "teams"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teams = try values.decodeIfPresent([Teams].self, forKey: .teams)
    }

}

