import UIKit

class RegisterViewController: BaseViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.delegate = self
        self.mobileNumberTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        registerButton.layer.cornerRadius = 15
    }
    
    @IBAction func registerActionButton(_ sender: Any) {
        if ((usernameTextField.text?.isEmpty) == true) {
            error = "Username is empty"
            showErrorAlert()
        }
        else if ((mobileNumberTextField.text?.isEmpty) == true) {
            error = "Mobile Number is empty"
            showErrorAlert()
        }
        else if ((emailTextField.text?.isEmpty) == true) {
            error = "E-mail Adress is empty"
            showErrorAlert()
        }
        else if ((passwordTextField.text?.isEmpty) == true) {
            error = "Password is empty"
            showErrorAlert()
        } else {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
