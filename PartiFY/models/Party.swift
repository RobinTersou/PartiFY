//
//  Party.swift
//  PartiFY
//
//  Created by Robin Tersou on 27/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import Foundation

struct Party {
    let name:String
    let lng:Float
    let lat:Float
    let date_start:String
    let date_end:String
    
    init(name: String, date_start: String, date_end: String, lng: Float, lat: Float) {
        self.name = name
        self.date_start = date_start
        self.date_end = date_end
        self.lat = lat
        self.lng = lng
    }
}

extension Party: Decodable {
    enum MyStructKeys: String, CodingKey {
        case name = "name"
        case lng = "lng"
        case lat = "lat"
        case date_start = "date_start"
        case date_end = "date_end"
    }
    
    init(from decoder: Decoder) throws {
        let party = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let name: String = try party.decode(String.self, forKey: .name) // extracting the data
        let lng: Float = try party.decode(Float.self, forKey: .lng) // extracting the data
        let lat: Float = try party.decode(Float.self, forKey: .lat) // extracting the data
        let date_start: String = try party.decode(String.self, forKey: .date_start)
        let date_end: String = try party.decode(String.self, forKey: .date_end)
        
        self.init(name: name, date_start: date_start, date_end: date_end, lng: lng, lat: lat) // initializing our struct
    }
}
