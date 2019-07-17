//
//  User.swift
//  PartiFY
//
//  Created by Robin Tersou on 27/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import Foundation

struct User {
    let id:Int
    let lastname:String
    let firstname:String
    let email:String
    
    init(id: Int, lastname: String, firstname: String, email: String) {
        self.id = id
        self.lastname = lastname
        self.firstname = firstname
        self.email = email
    }
}

extension User: Decodable {
    enum MyStructKeys: String, CodingKey {
        case id = "id"
        case lastname = "lastname"
        case firstname = "firstname"
        case email = "email"
    }
    
    init(from decoder: Decoder) throws {
        let user = try decoder.container(keyedBy: MyStructKeys.self) // defining our (keyed) container
        let id: Int = try user.decode(Int.self, forKey: .id) // extracting the data
        let lastname: String = try user.decode(String.self, forKey: .lastname) // extracting the data
        let firstname: String = try user.decode(String.self, forKey: .firstname) // extracting the data
        let email: String = try user.decode(String.self, forKey: .email)
        
        self.init(id: id, lastname: lastname, firstname: firstname, email: email) // initializing our struct
    }
}
