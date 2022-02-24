import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var searchCoctailByNameButton: UIButton!
    @IBOutlet weak var filterByAlcoholicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        searchCoctailByNameButton.layer.cornerRadius = 15
        filterByAlcoholicButton.layer.cornerRadius = 15
    }
    
    @IBAction func searchCoctailByName(_ sender: Any) {
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Search") as! SearchViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func filterByAlcoholic(_ sender: Any) {
        let sb = UIStoryboard(name: "Filter", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Filter") as! FilterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
