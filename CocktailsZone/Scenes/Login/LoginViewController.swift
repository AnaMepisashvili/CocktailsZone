import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var LoginLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    private var loginviewModel: LoginViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setupViewModel()
        configureleftIcons()
        ConfigureTextFieldShouldReturn()
    }
    
    override func viewWillLayoutSubviews() {
        stackView.setCustomSpacing(10.0, after: emailTextField)
        stackView.setCustomSpacing(10.0, after: passwordTextField)
    }
    
    func setupViewModel() {
        loginviewModel = LoginViewModel()
        loginviewModel.presentAlert = { alert in
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        loginviewModel.navigation = { vc in
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func ConfigureTextFieldShouldReturn() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func configureleftIcons() {
        guard let envelopeIcon = UIImage(systemName: "envelope") else { return }
        guard let lockIcon = UIImage(systemName: "lock") else { return }
        addleftImageTo(usernameTextField: emailTextField,
                       passwordTextField: passwordTextField,
                       envelopeIcon: envelopeIcon,
                       lockIcon: lockIcon)
    }
    
    func addleftImageTo(usernameTextField: UITextField, passwordTextField: UITextField, envelopeIcon: UIImage, lockIcon: UIImage) {
        let leftImageViewEnvelope = UIImageView()
        leftImageViewEnvelope.image = envelopeIcon
        usernameTextField.leftView = leftImageViewEnvelope
        usernameTextField.tintColor = UIColor(named: "#98D4D9")
        usernameTextField.leftViewMode = .always
        
        let leftImageViewLock = UIImageView()
        leftImageViewLock.image = lockIcon
        passwordTextField.leftView = leftImageViewLock
        passwordTextField.tintColor = UIColor(named: "#98D4D9")
        passwordTextField.leftViewMode = .always
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginActionButton(_ sender: Any) {
        loginviewModel.loginClicked(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func registerActionButton(_ sender: Any) {
        let sb = UIStoryboard(name: "Register", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "Register") as? RegisterViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
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

