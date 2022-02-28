import Foundation

struct Cocktails: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let name: String?
    let cocktailImage: String?

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case cocktailImage = "strDrinkThumb"
    }
}
