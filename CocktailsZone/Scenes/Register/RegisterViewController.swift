import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private var registerViewModel: RegisterViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        configureleftIcons()
        ConfigureTextFieldShouldReturn()
    }
    
    override func viewWillLayoutSubviews() {
        title = "Register"
        
        stackView.setCustomSpacing(10.0, after: usernameTextField)
        stackView.setCustomSpacing(10.0, after: mobileNumberTextField)
        stackView.setCustomSpacing(10.0, after: emailTextField)
        stackView.setCustomSpacing(10.0, after: passwordTextField)
    }
    
    func setupViewModel() {
        registerViewModel = RegisterViewModel()
        registerViewModel.presentAlert = { alert in
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
        registerViewModel.navigation = { vc in
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func ConfigureTextFieldShouldReturn() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        mobileNumberTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func configureleftIcons() {
        guard let personIcon = UIImage(systemName: "person") else { return }
        guard let phoneIcon = UIImage(systemName: "phone") else { return }
        guard let envelopeIcon = UIImage(systemName: "envelope") else { return }
        guard let lockIcon = UIImage(systemName: "lock") else { return }
        
        addLeftIconTo(usernameTextField: usernameTextField,
                      mobileNumberTextField: mobileNumberTextField,
                      emailTextField: emailTextField,
                      passwordTextField: passwordTextField,
                      personIcon: personIcon,
                      phoneIcon: phoneIcon,
                      envelopeIcon: envelopeIcon,
                      lockIcon: lockIcon)
    }
    
    func addLeftIconTo(usernameTextField: UITextField,
                       mobileNumberTextField: UITextField,
                       emailTextField: UITextField,
                       passwordTextField: UITextField,
                       personIcon: UIImage,
                       phoneIcon: UIImage,
                       envelopeIcon: UIImage,
                       lockIcon: UIImage) {
        
        let leftIconPerson = UIImageView()
        leftIconPerson .image = personIcon
        usernameTextField.leftView = leftIconPerson
        usernameTextField.tintColor = UIColor(named: "#98D4D9")
        usernameTextField.leftViewMode = .always
        
        let leftIconPhone = UIImageView()
        leftIconPhone.image = phoneIcon
        mobileNumberTextField.leftView = leftIconPhone
        mobileNumberTextField.tintColor = UIColor(named: "#98D4D9")
        mobileNumberTextField.leftViewMode = .always
        
        let leftIconEnvelope = UIImageView()
        leftIconEnvelope.image = envelopeIcon
        emailTextField.leftView = leftIconEnvelope
        emailTextField.tintColor = UIColor(named: "#98D4D9")
        emailTextField.leftViewMode = .always
        
        let leftIconLock = UIImageView()
        leftIconLock.image = lockIcon
        passwordTextField.leftView = leftIconLock
        passwordTextField.tintColor = UIColor(named: "#98D4D9")
        passwordTextField.leftViewMode = .always
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerActionButton(_ sender: Any) {
        registerViewModel.registerClicked(username: usernameTextField.text ?? "", number: mobileNumberTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

extension RegisterViewController: UITextFieldDelegate {
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
