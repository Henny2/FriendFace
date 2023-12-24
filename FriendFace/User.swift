//
//  User.swift
//  FriendFace
//
//  Created by Henrieke Baunack on 12/23/23.
//

import Foundation

struct User: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }
    
    var id: String
    var isActive: Bool
    var name : String
    var age: Int
    var company : String
    var email : String
    var address: String
    var about: String
    var registered: Date // or string? <- need to convert this to date
    var tags: [String]
    var friends: [Friend]
    
    // realized the custom codable keys are not necessary as there is a decoding strategy to handle dates
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.isActive = try container.decode(Bool.self, forKey: .isActive)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.age = try container.decode(Int.self, forKey: .age)
//        self.company = try container.decode(String.self, forKey: .company)
//        self.email = try container.decode(String.self, forKey: .email)
//        self.address = try container.decode(String.self, forKey: .address)
//        self.about = try container.decode(String.self, forKey: .about)
//        // transform the string into date
//        let stringDate = try container.decode(String.self, forKey: .registered)
//        self.registered = Date(stringDate)
//        self.registered = try container.decode(String.self, forKey: .registered)
//        self.tags = try container.decode([String].self, forKey: .tags)
//        self.friends = try container.decode([Friend].self, forKey: .friends)
//        
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.isActive, forKey: .isActive)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.age, forKey: .age)
//        try container.encode(self.company, forKey: .company)
//        try container.encode(self.email, forKey: .email)
//        try container.encode(self.address, forKey: .address)
//        try container.encode(self.about, forKey: .about)
//        try container.encode(self.registered, forKey: .registered)
//        try container.encode(self.tags, forKey: .tags)
//        try container.encode(self.friends, forKey: .friends)
//    }
}
