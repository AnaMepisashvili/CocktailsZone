import Foundation
import FirebaseAuth

protocol SettingsViewModelProtocol: AnyObject {
    func getUser()
    func saveImage(with image: Data)

    var savedUser: UserData { get set }
}

class SettingsViewModel: SettingsViewModelProtocol {
    var coreDataManager = CoreDataManager()
    
    var savedUsers = [UserData]()
    var savedUser = UserData()
    
    func getUser() {
        coreDataManager.getUser { savedUsers in
            self.savedUsers = savedUsers
        }
        for savedUser in savedUsers {
            let userID = Auth.auth().currentUser?.uid
            if userID == savedUser.userID {
                self.savedUser = savedUser
                guard let image = savedUser.userImage else {return}
                self.saveImage(with: image)
            }
                self.savedUser = savedUser
        }
    }
    
    func saveImage(with image: Data) {
        coreDataManager.updateUserImage(with: savedUser, image: image)
    }
}
