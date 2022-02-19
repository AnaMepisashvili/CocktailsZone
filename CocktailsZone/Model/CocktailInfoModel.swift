//
//  CocktailsModel.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import Foundation

struct Cocktails: Codable {
    let name: String?
    let instructions: String?
    let category: String?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case instructions = "text"
        case category = ""
        case avatarUrl = "image_url"
    }
}

