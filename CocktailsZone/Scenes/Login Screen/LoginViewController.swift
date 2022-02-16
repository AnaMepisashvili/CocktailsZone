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
            navigationController?.setViewControllers([vc], animated: true)
        }
        else {
            error = "Error"
            showError()
        }
    }
    

}
