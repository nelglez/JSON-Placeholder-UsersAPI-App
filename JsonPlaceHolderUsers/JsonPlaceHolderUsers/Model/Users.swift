//
//  Users.swift
//  JsonPlaceHolderUsers
//
//  Created by Nelson Gonzalez on 3/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

struct Users: Decodable {
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let companyWebsite: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case username
        case email
        case phone
        case company
        case website
        
        enum CompanyCodingKeys: String, CodingKey {
            case companyWebsite = "name"
        }
        
    }
    
     init(from decoder: Decoder) throws {
        //create a cotainer
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let name = try container.decode(String.self, forKey: .name)
        let username = try container.decode(String.self, forKey: .username)
        let email = try container.decode(String.self, forKey: .email)
        let phone = try container.decode(String.self, forKey: .phone)
        let website = try container.decode(String.self, forKey: .website)
        
        let companyContainer = try container.nestedContainer(keyedBy: CodingKeys.CompanyCodingKeys.self, forKey: .company)
        let companyWebsite = try companyContainer.decode(String.self, forKey: .companyWebsite)
        
        self.name = name
        self.username = username
        self.email = email
        self.phone = phone
        self.website = website
        self.companyWebsite = companyWebsite
    }
}


//Model Json
/*
 [ <-- Array of objects
 {  <-- Users object
 "id": 1,
 "name": "Leanne Graham",
 "username": "Bret",
 "email": "Sincere@april.biz",
 "address": {
 "street": "Kulas Light",
 "suite": "Apt. 556",
 "city": "Gwenborough",
 "zipcode": "92998-3874",
 "geo": {
 "lat": "-37.3159",
 "lng": "81.1496"
 }
 },
 "phone": "1-770-736-8031 x56442",
 "website": "hildegard.org",
 "company": {
 "name": "Romaguera-Crona",
 "catchPhrase": "Multi-layered client-server neural-net",
 "bs": "harness real-time e-markets"
 }
 }
 ]
 */
