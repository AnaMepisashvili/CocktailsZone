import Foundation
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
    func showAlert(message: String)
    func loginClicked(email: String, password: String)
    
    var navigation: ((UIViewController)->())? {get set}
    var presentAlert: ((UIAlertController)->())? {get set}
}

class LoginViewModel: LoginViewModelProtocol {
    var navigation: ((UIViewController)->())?
    var presentAlert: ((UIAlertController)->())?
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.presentAlert?(alert)
    }
    
    func loginClicked(email: String, password: String) {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                self.showAlert(message: "You need to Register or check your E-mail and Password fields.")
            } else {
                let sb = UIStoryboard(name: "TabBarController", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "TabBarController")
                self.navigation?(vc)
            }
        }
    }
}
