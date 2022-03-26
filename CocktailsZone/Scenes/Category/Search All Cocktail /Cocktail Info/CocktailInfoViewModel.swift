import Foundation
import FirebaseAuth

class CocktailInfoViewModel {
    var coreDataManager = CoreDataManager()
    var favouriteCocktails: [FavoritesData] = []
    var isSaved = Bool()
    
    var savedUsers = [UserData]()
    var savedUser = UserData()
    
    func saveCoctailInfo(model: CocktailInfo, image: Data) {
        coreDataManager.saveCoctailInfo(usingModel: model, user: self.savedUser, image: image, completion: { _ in })
    }
    
    func deleteCoctailInfo(cocktailName: String) {
        coreDataManager.deleteCocktailInfo(usingModel: cocktailName) { cocktails in
            self.favouriteCocktails = cocktails
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
    
    func checkIfSaved(cocktailName: String){
        fetchFavouriteCocktails()
        for favouriteCocktail in favouriteCocktails {
            if favouriteCocktail.cocktailName == cocktailName {
                isSaved = true
            }
        }
    }
    
    func fetchFavouriteCocktails(){
        coreDataManager.getCoctailInfo(user: savedUser) { favCocktails in
            self.favouriteCocktails = favCocktails
        }
    }
}
