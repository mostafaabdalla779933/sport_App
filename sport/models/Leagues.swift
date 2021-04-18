//
//  Leagues.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation

struct Leagues : Codable {
    let idLeague : String?
    let strLeague : String?
    let strSport : String?
    let strLeagueAlternate : String?

    enum CodingKeys: String, CodingKey {

        case idLeague = "idLeague"
        case strLeague = "strLeague"
        case strSport = "strSport"
        case strLeagueAlternate = "strLeagueAlternate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
        strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
        strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
        strLeagueAlternate = try values.decodeIfPresent(String.self, forKey: .strLeagueAlternate)
    }

}
