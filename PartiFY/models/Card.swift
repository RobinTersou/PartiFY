//
//  Card.swift
//  PartiFY
//
//  Created by Robin Tersou on 28/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import Foundation

struct Card {
    let id: Int
    let name: String
    let card_number: Int
    
    init(id : Int, name: String, card_number: Int) {
        self.id = id
        self.name = name
        self.card_number = card_number
    }
}

extension Card: Decodable {
    enum MyStructKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case card_number = "card_number"
    }
    
    init(form decoder: Decoder) throws {
        let card = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let id: Int = try card.decode(Int.self, forKey: .id) // extracting the data
        let name: String = try card.decode(String.self, forKey: .name) // extracting the data
        let card_number: Int = try card.decode(Int.self, forKey: .card_number) // extracting the data
        
        self.init(id: id, name: name, card_number: card_number) // initializing our struct
    }
}
