import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func getCocktails(name: String)
    
    var cocktailArray: [CocktailInfo] { get set }
    var reloadTableView: (()->())? { get set }
}

class SearchViewModel: SearchViewModelProtocol {
    private var apiService: CocktailServiceProtocol!
    
    var cocktailArray: [CocktailInfo] = [] {
        didSet{
            self.reloadTableView?()
        }
    }
    
    var reloadTableView: (()->())?
    
    init(apiService: CocktailServiceProtocol) {
        self.apiService = apiService
    }
    
    func getCocktails(name: String) {
        apiService.fetchCocktail(name: name) { cocktails in
            self.cocktailArray = cocktails
        }
    }
}
