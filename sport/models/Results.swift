//
//  Results.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//


import Foundation
struct Results : Codable {
    let idResult : String?
    let idPlayer : String?
    let strPlayer : String?
    let idTeam : String?
    let idEvent : String?
    let strEvent : String?
    let strResult : String?
    let intPosition : String?
    let intPoints : String?
    let strDetail : String?
    let dateEvent : String?
    let strSeason : String?
    let strCountry : String?
    let strSport : String?

    enum CodingKeys: String, CodingKey {

        case idResult = "idResult"
        case idPlayer = "idPlayer"
        case strPlayer = "strPlayer"
        case idTeam = "idTeam"
        case idEvent = "idEvent"
        case strEvent = "strEvent"
        case strResult = "strResult"
        case intPosition = "intPosition"
        case intPoints = "intPoints"
        case strDetail = "strDetail"
        case dateEvent = "dateEvent"
        case strSeason = "strSeason"
        case strCountry = "strCountry"
        case strSport = "strSport"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idResult = try values.decodeIfPresent(String.self, forKey: .idResult)
        idPlayer = try values.decodeIfPresent(String.self, forKey: .idPlayer)
        strPlayer = try values.decodeIfPresent(String.self, forKey: .strPlayer)
        idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
        idEvent = try values.decodeIfPresent(String.self, forKey: .idEvent)
        strEvent = try values.decodeIfPresent(String.self, forKey: .strEvent)
        strResult = try values.decodeIfPresent(String.self, forKey: .strResult)
        intPosition = try values.decodeIfPresent(String.self, forKey: .intPosition)
        intPoints = try values.decodeIfPresent(String.self, forKey: .intPoints)
        strDetail = try values.decodeIfPresent(String.self, forKey: .strDetail)
        dateEvent = try values.decodeIfPresent(String.self, forKey: .dateEvent)
        strSeason = try values.decodeIfPresent(String.self, forKey: .strSeason)
        strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
        strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
    }

}
