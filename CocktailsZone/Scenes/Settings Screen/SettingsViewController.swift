//
//  SettingsViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogOut(_ sender: Any) {
        let sb = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
