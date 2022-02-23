import Foundation

protocol CocktailServiceProtocol: AnyObject {
    func fetchCocktail(name: String, completion: @escaping ((Result<[Cocktail], Error>) -> Void))
}

class CocktailsInfoApi: CocktailServiceProtocol {
    private var count = 0
    
    func fetchCocktail(name: String, completion: @escaping ((Result<[Cocktail], Error>) -> Void)) {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=" + name
        
        NetworkManager.shared.get(url: url) { (result: Result<CocktailsResponce, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(.success(response.drinks))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
