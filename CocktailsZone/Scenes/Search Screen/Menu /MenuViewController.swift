//
//  MenuViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 19.02.22.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchCoctailByName(_ sender: Any) {
        let sb = UIStoryboard(name: "SearchViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func filterByAlcoholic(_ sender: Any) {
        let sb = UIStoryboard(name: "FilterViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
