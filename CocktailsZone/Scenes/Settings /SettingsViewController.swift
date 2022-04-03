import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    
    private var settingsViewModel: SettingsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupViewModel()
    }
    
    override func viewWillLayoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileImageView.image = UIImage(data: ((settingsViewModel.savedUser.userImage ?? UIImage(named: "default")?.pngData())!))
    }
    
    func setupViewModel() {
        settingsViewModel = SettingsViewModel()
        settingsViewModel.getUser()

        self.usernameLabel.text = settingsViewModel.savedUser.username
    }
        
    @IBAction func uploadImageAction(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func LogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
        let sb = UIStoryboard(name: "Login", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "Login") as? LoginViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage  {
            profileImageView.image = image
            settingsViewModel.savedUser.userImage = profileImageView.image?.pngData()
        }
        self.settingsViewModel.saveImage(with: (settingsViewModel.savedUser.userImage ?? UIImage(named: "FirstSlide")?.pngData())!)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
