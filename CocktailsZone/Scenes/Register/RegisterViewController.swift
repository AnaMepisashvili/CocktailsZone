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
        
        configureleftIcons()
    }
    
    override func viewWillLayoutSubviews() {
        title = "Register"
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
            successfullyRegisteredAlert()
            UserDefault.createUser(usernameTextField: usernameTextField.text!, passwordTextField: passwordTextField.text!)
        }
    }
    
    func showErrorAlert() {
        let alert = UIAlertController.init(title: "Regisration Failed", message: error, preferredStyle: .alert)
        let Action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
        alert.addAction(Action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func successfullyRegisteredAlert() {
        let alert = UIAlertController(title: nil, message: "Registration completed successfully", preferredStyle: .alert)
        let act = UIAlertAction.init(title: "Login", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(act)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
}
