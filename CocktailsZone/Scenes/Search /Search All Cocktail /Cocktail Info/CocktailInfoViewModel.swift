import Foundation
import FirebaseAuth

class CocktailInfoViewModel {
    var coreDataManager = CoreDataManager()
    
    var savedUsers = [UserData]()
    var savedUser = UserData()
    
    func saveCoctailInfo(model: CocktailInfo, image: Data) {
        coreDataManager.saveCoctailInfo(usingModel: model, user: self.savedUser, image: image, completion: { _ in })
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
}
