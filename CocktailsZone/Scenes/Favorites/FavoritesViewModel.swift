import UIKit
import FirebaseAuth

class FavoritesViewModel {
    var reloadTableView: (()->())?
    var models: [FavoritesData] = [FavoritesData](){
        didSet{
            self.reloadTableView?()
        }
    }
    var savedUsers = [UserData]()
    var savedUser = UserData()
    
    var coreDataManager = CoreDataManager()
    
    func refresh() {
        getUser()
        coreDataManager.getCoctailInfo(user: savedUser) { [weak self] models in
            guard let self = self else { return }
            self.models = models
        }
    }
    
    func getUser() {
        coreDataManager.getUser { savedUsers in
            self.savedUsers = savedUsers
        }
        for savedUser in savedUsers {
            let userID = Auth.auth().currentUser?.uid
            if userID == savedUser.userID {
                self.savedUser = savedUser
            }
        }
    }
    
    func deleteCocktail(with coctailName: String){
        coreDataManager.deleteCocktailInfo(usingModel: coctailName) { cocktails in
            self.models = cocktails
        }
    }
}
