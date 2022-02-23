import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        logOutButton.layer.cornerRadius = 15
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2
    }
    
    @IBAction func LogOut(_ sender: Any) {
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
