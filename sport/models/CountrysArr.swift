//
//  CountrysArr.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
struct CountrysArr : Codable {
    let countrys : [Countrys]?

    enum CodingKeys: String, CodingKey {

        case countrys = "countrys"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countrys = try values.decodeIfPresent([Countrys].self, forKey: .countrys)
    }

}
