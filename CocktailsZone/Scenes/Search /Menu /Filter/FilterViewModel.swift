//import UIKit
//
//protocol SearchViewModelProtocol: AnyObject {
//    func getCocktails(name: String, completion: @escaping (([CocktailInfo]) -> Void))
//    var cocktailArray: [CocktailInfo] { get set }
//    var reloadTableView: (()->())? { get set }
//}
//
//class FilterViewModel: SearchViewModelProtocol {
//    private var apiService: CocktailServiceProtocol!
//    
//    var cocktailArray = [CocktailInfo]()
//    var reloadTableView: (()->())?
//    
//    init(apiService: CocktailServiceProtocol) {
//        self.apiService = apiService
//    }
//    
//    func getCocktails(name: String, completion: @escaping (([CocktailInfo]) -> Void)) {
//        apiService.fetchCocktail(name: name) { [weak self] result in
//            switch result {
//            case .success(let cocktails):
//                guard let self = self else {return}
//                self.cocktailArray = cocktails
//                completion(self.cocktailArray)
//                self.reloadTableView?()
//            case .failure(let err):
//                print(err)
//            }
//        }
//    }
//}
