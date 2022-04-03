import Foundation
import FirebaseAuth

protocol RegisterViewModelProtocol: AnyObject {
    func showAlert(message: String)
    func registerClicked(username: String, number: String, email: String, password: String)
    
    var navigation: ((UIViewController)->())? {get set}
    var presentAlert: ((UIAlertController)->())? {get set}
}

class RegisterViewModel: RegisterViewModelProtocol {
    var navigation: ((UIViewController) -> ())?
    var presentAlert: ((UIAlertController) -> ())?
    
    var coreDataManager = CoreDataManager()
    var savedUser = UserData()
    var user = UserInfo(username: "", email: "", number: "", password: "", userImage: "", userID: "")
    
    func createNewUser(username: String, userID: String, email: String, password: String, number: String, userImage: String) {
        user.email = email
        user.username = username
        user.password = password
        user.number = number
        user.userImage = userImage
        user.userID = userID
    }
    
    func saveUser(with user: UserInfo) {
        coreDataManager.saveUser(user: user) { savedUser in
            self.savedUser = savedUser
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        let Action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(Action)
        self.presentAlert?(alert)
    }
    
    func validateFields(username: String, phone: String, email: String, password: String) -> String? {
        if username.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phone.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            showAlert(message: "Please fill in all fields.")
            return  ""
        }
        let cleanedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedPassword.isPasswordValid() == false {
            showAlert(message: "Please make sure your password is at least 8 characters, contains a special character and a number.")
            return ""
        }
        return nil
    }
    
    func registerClicked(username: String, number: String, email: String, password: String) {
        let error = validateFields(username: username, phone: number, email: email, password: password)
        
        if error != nil {
            self.showAlert(message: "Something is wrong")
        } else {
            let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showAlert(message: "E-mail Adress is wrong")
                } else {
                    let user = Auth.auth().currentUser
                    if let user = user {
                        let changeRequest = user.createProfileChangeRequest()
                        changeRequest.displayName = username
                        changeRequest.commitChanges { error in
                            if let error = error {
                                print(error)
                            }
                        }
                    }
                    guard let userID = user?.uid else {return}
                    self.createNewUser(username: username, userID: userID, email: email, password: password, number: number, userImage: "")
                    self.saveUser(with: self.user)
                    self.successfullyRegisteredAlert(message: "Registration completed successfully!")
                }
            }
        }
    }
    
    func successfullyRegisteredAlert(message: String) {
        let alert = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { alert in
            let sb = UIStoryboard(name: "Login", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: "Login") as? LoginViewController else {return}
            self.navigation?(vc)
        }))
        self.presentAlert?(alert)
    }
}
