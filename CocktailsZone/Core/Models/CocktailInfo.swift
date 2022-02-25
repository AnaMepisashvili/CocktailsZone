import Foundation

struct CocktailsResponce: Codable {
    let drinks: [CocktailInfo]
}

struct CocktailInfo: Codable {
    let name: String?
    let instructions: String?
    let category: String?
    let avatarUrl: String?

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case instructions = "strInstructions"
        case category = "strCategory"
        case avatarUrl = "strDrinkThumb"
    }
}
