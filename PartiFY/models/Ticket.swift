//
//  Ticket.swift
//  PartiFY
//
//  Created by Robin Tersou on 27/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import Foundation

struct Ticket {
    let id: Int
    let partyName: String
    let price: Float
    let number: Int
    
    init(id: Int, partyName: String, price: Float, number: Int) {
        self.id = id
        self.partyName = partyName
        self.price = price
        self.number = number
    }
}

extension Ticket: Decodable {
    enum MyStructKeys: String, CodingKey {
        case id = "id"
        case partyName = "partyName"
        case price = "price"
        case number = "number"
    }
    
    init(from decoder: Decoder) throws {
        let ticket = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let id: Int = try ticket.decode(Int.self, forKey: .id) // extracting the data
        let partyName: String = try ticket.decode(String.self, forKey: .partyName) // extracting the data
        let price: Float = try ticket.decode(Float.self, forKey: .price) // extracting the data
        let number: Int = try ticket.decode(Int.self, forKey: .number)
        
        self.init(id: id, partyName: partyName, price: price, number: number) // initializing our struct
    }
}
