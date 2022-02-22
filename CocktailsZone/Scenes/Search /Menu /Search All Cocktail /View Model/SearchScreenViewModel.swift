import UIKit

protocol SearchScreenViewModelProtocol: AnyObject{
    func getCocktails(pagination: Bool, completion: @escaping (([Cocktails]) -> Void))
}

class SearchScreenViewModel: SearchScreenViewModelProtocol {
    private var apiService: CocktailServiceProtocol!
    
    init(apiService: CocktailServiceProtocol) {
        self.apiService = apiService
    }
    
    func getCocktails(pagination: Bool, completion: @escaping (([Cocktails]) -> Void)){
        self.apiService.getCocktails(pagination: pagination) { [weak self] cocktails in
            //            completion(cocktails)
        }
    }
    
}
