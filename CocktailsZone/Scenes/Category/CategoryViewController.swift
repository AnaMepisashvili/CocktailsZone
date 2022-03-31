import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var searchCoctailByNameButton: UIButton!
    @IBOutlet weak var filterByAlcoholicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    @IBAction func searchCoctailByName(_ sender: UIButton) {
        sender.pulsate()
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Search") as! SearchViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func filterByAlcoholic(_ sender: UIButton) {
        sender.pulsate()
        let sb = UIStoryboard(name: "Filter", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Filter") as! FilterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}