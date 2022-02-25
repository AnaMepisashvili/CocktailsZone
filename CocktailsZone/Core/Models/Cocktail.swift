import Foundation

struct Cocktails: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let name: String?
    let avatarUrl: String?

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case avatarUrl = "strDrinkThumb"
    }
}
