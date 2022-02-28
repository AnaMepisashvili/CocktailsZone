import Foundation

protocol NonAlcoholServiceProtocol: AnyObject {
    func fetchNonAlcoholCocktail(completion: @escaping (([Cocktail]) -> Void))
}

class NonAlcoholApi: NonAlcoholServiceProtocol {
    
    func fetchNonAlcoholCocktail(completion: @escaping (([Cocktail]) -> Void)) {
        let url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
        
        NetworkManager.shared.get(url: url) { (result: Result<Cocktails, Error>) in
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
