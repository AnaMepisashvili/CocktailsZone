import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FavoritesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configTableView()
    }
    
    func configureViewModel() {
        viewModel = FavoritesViewModel()
        viewModel.refresh()
        viewModel.reloadTableView = {DispatchQueue.main.async {
            self.tableView.reloadData()
        }}
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "FavoritesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FavoritesTableViewCell")
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell") as? FavoritesTableViewCell
        cell?.configure(with: viewModel.models[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CocktailInfo", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CocktailInfo") as! CocktailInfoViewController
//        vc.savedCoctail = viewModel.models[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let tempManager = ModelManager(with: PersistantManager())
        
        let action1 = UIContextualAction(style: .destructive,
                                         title: "Delete") { [weak self] a, b, c in
            guard let self = self else { return }
            tempManager.deleteModel(usingModel: self.viewModel.models[indexPath.row]) { bool in
                print(bool)
            }
            self.viewModel.refresh()
        }
        
        let swipeConfigure = UISwipeActionsConfiguration(actions: [action1])
        return swipeConfigure
    }
}
