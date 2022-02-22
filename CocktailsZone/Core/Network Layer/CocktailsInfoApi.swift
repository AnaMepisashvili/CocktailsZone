import Foundation

protocol CocktailServiceProtocol: AnyObject {
    func getCocktails(pagination: Bool, completion: @escaping ([[String: String?]]) -> Void)
}

class CocktailsInfoApi: CocktailServiceProtocol {
    private var count = 0
    
    func getCocktails(pagination: Bool, completion: @escaping ([[String: String?]]) -> Void) {
        if pagination {
            count += 1
        }
        
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(count)"
        
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
