//import Foundation
//import FirebaseAuth
//
//class SaveUser {
//    static let shared = SaveUser()
//    private init() {    }
//    let coreDataManager = CoreDataManager()
//
//    var savedUsers = [UserData]()
//    var savedUser: UserData?
//
//
//    func getUser() {
//        coreDataManager.getUser { savedUsers in
//            self.savedUsers = savedUsers
//        }
//        for savedUser in savedUsers {
//            let userID = Auth.auth().currentUser?.uid
//            if userID == savedUser.userID {
//                self.savedUser = savedUser
//            }
//        }
//    }
//
//    func saveAsFavourite(coctail: CocktailInfo, image: Data) {
//        guard let savedUser = savedUser else {
//            fatalError()
//            return
//        }
//
//        coreDataManager.saveCoctailInfo(usingModel: coctail, user: savedUser, image: image) { bool in
//        }
//    }
//}
