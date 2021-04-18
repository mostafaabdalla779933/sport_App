//
//  ResultsArr.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//


import Foundation
struct ResultsArr : Codable {
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

}
