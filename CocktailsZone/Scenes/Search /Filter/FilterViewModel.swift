import Foundation

protocol FilterModelProtocol: AnyObject {
    func getCocktail()

    var alcoholArray: [Cocktail] { get set }
    var nonAlcoholArray: [Cocktail] { get set }
    var reloadTableView: (()->())? { get set }
}

class FilterViewModel: FilterModelProtocol {
    
    private var alcoholApiService: AlcoholServiceProtocol!
    private var nonAlcoholApiService: NonAlcoholServiceProtocol!
    
    var alcoholArray: [Cocktail] = [] {
        didSet {
            self.reloadTableView?()
        }
    }
    
    var nonAlcoholArray: [Cocktail] = [] {
        didSet{
            self.reloadTableView?()
        }
    }
    
    var reloadTableView: (()->())?
    
    init(alcoholApiService: AlcoholServiceProtocol, nonAlcoholApiService: NonAlcoholServiceProtocol) {
        self.alcoholApiService = alcoholApiService
        self.nonAlcoholApiService = nonAlcoholApiService
    }
    
    func getCocktail() {
        alcoholApiService.fetchAlcoholCocktail { alcoholCoctails in
            self.alcoholArray = alcoholCoctails
        }
        nonAlcoholApiService.fetchNonAlcoholCocktail { nonAlcoholCoctails in
            self.nonAlcoholArray = nonAlcoholCoctails
        }
    }
}
