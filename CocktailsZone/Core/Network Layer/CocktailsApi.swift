import Foundation

protocol CocktailServiceProtocol: AnyObject {
    func fetchCocktail(name: String, completion: @escaping (([CocktailInfo]) -> Void))
}

class CocktailsApi: CocktailServiceProtocol {
    func fetchCocktail(name: String, completion: @escaping (([CocktailInfo]) -> Void)) {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + name
        
        NetworkManager.shared.get(url: url) { (result: Result<CocktailsResponce, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(response.drinks)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}
