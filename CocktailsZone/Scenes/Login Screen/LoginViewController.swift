//
//  LoginViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 15.02.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordIcon: UIImageView!
    @IBOutlet weak var usernameIcon: UIImageView!
    @IBOutlet weak var LoginLabel: UILabel!
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func showError () {
        let alert = UIAlertController.init(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "okay", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginActionButton(_ sender: Any) {
        guard let unwrapedUserName = usernameTextField.text else {
            return
        }
        guard let unwrapedPassword = passwordTextField.text else {
            return
        }
        if passwordTextField.text == UserDefault.getPasswordForThisUser(usernameTextField: unwrapedUserName) && !unwrapedPassword.isEmpty {
            let sb = UIStoryboard(name: "TabBarController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TabBarController")
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            error = "Error"
            showError()
        }
    }
    
    @IBAction func registerActionButton(_ sender: Any) {
        let sb = UIStoryboard(name: "RegistrationViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // for hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
