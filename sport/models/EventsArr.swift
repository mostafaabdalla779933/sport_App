//
//  EventsArr.swift
//  sport
//
//  Created by mosatafa abdalla on 4/18/21.
//  Copyright © 2021 mosatafa abdalla. All rights reserved.
//

import Foundation
struct EventsArr : Codable {
    let events : [Events]?

    enum CodingKeys: String, CodingKey {

        case events = "events"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decodeIfPresent([Events].self, forKey: .events)
    }

}
