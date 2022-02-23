import UIKit
import CloudKit

class LoginViewController: BaseViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var error = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        configureleftIcons()
        configureTableView()
    }
    
    override func viewWillLayoutSubviews() {
        loginButton.layer.cornerRadius = 15
        stackView.setCustomSpacing(10.0, after: usernameTextField)
        stackView.setCustomSpacing(10.0, after: passwordTextField)
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
        } else {
            error = "Error"
            showError()
        }
    }
    
    @IBAction func registerActionButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Register", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureleftIcons() {
        guard let personIcon = UIImage(systemName: "person") else { return }
        guard let lockIcon = UIImage(systemName: "lock") else { return }
        addleftImageTo(usernameTextField: usernameTextField,
                       passwordTextField: passwordTextField,
                       personIcon: personIcon,
                       lockIcon: lockIcon)
    }
    
    func addleftImageTo(usernameTextField: UITextField, passwordTextField: UITextField, personIcon: UIImage, lockIcon: UIImage) {
        let leftImageViewPerson = UIImageView()
        leftImageViewPerson.image = personIcon
        usernameTextField.leftView = leftImageViewPerson
        usernameTextField.tintColor = UIColor(named: "#98D4D9")
        usernameTextField.leftViewMode = .always
        
        let leftImageViewLock = UIImageView()
        leftImageViewLock.image = lockIcon
        passwordTextField.leftView = leftImageViewLock
        passwordTextField.tintColor = UIColor(named: "#98D4D9")
        passwordTextField.leftViewMode = .always
    }
    
    func configureTableView() {
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func showError() {
        let alert = UIAlertController.init(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "okay", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

