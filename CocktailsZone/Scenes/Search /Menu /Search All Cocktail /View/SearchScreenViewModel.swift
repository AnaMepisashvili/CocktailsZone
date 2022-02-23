import UIKit

protocol SearchScreenViewModelProtocol: AnyObject {
    func getCocktails(name: String, completion: @escaping (([Cocktail]) -> Void))
    var cocktailArray: [Cocktail] { get set }
    var reloadTableView: (()->())? { get set }
}

class SearchScreenViewModel: SearchScreenViewModelProtocol {
    private var apiService: CocktailServiceProtocol!
    
    var cocktailArray = [Cocktail]()
    var reloadTableView: (()->())?
    
    init(apiService: CocktailServiceProtocol) {
        self.apiService = apiService
    }
    
    func getCocktails(name: String, completion: @escaping (([Cocktail]) -> Void)) {
        apiService.fetchCocktail(name: name) { [weak self] result in
            switch result {
            case .success(let cocktails):
                guard let self = self else {return}
                self.cocktailArray = cocktails
                completion(self.cocktailArray)
                self.reloadTableView?()
            case .failure(let err):
                print(err)
            }
        }
    }
}
