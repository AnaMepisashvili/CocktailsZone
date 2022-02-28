import Foundation

struct CocktailsResponce: Codable {
    let drinks: [CocktailInfo]
}

struct CocktailInfo: Codable {
    let name: String?
    let instruction: String?
    let category: String?
    let cocktailImage: String?

    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case instruction = "strInstructions"
        case category = "strCategory"
        case cocktailImage = "strDrinkThumb"
    }
}
