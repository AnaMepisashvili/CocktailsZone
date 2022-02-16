//
//  RegistrationViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 14.02.22.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registrationActionButton(_ sender: Any) {
        if ((usernameTextField.text?.isEmpty) == true){
            error = "Username is empty"
            showErrorAlert()
        }
        else if ((mobileNumberTextField.text?.isEmpty) == true){
            error = "Mobile Number is empty"
            showErrorAlert()
        }
        else if ((emailTextField.text?.isEmpty) == true){
            error = "E-mail Adress is empty"
            showErrorAlert()
        }
        else if ((passwordTextField.text?.isEmpty) == true) {
            error = "Password is empty"
            showErrorAlert()
        }
        
        else {
            UserDefault.createUser(usernameTextField: emailTextField.text!, passwordTextField: passwordTextField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func showErrorAlert() {
        let alert = UIAlertController.init(title: "Regisration Failed", message: error, preferredStyle: .alert)
        let Action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(Action)
        self.present(alert, animated: true, completion: nil)
    }

}
