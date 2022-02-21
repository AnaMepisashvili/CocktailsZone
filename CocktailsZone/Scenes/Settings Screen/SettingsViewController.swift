//
//  SettingsViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutButton.layer.cornerRadius = 15
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2
    }
    
    @IBAction func LogOut(_ sender: Any) {
        let sb = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
