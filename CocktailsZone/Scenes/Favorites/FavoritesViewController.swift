import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FavoritesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configureTableView()
        configureNavigationController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refresh()
    }
    func configureNavigationController() {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Favourites", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(named: "#98D4D9")
    }
    
    func configureViewModel() {
        viewModel = FavoritesViewModel()
        viewModel.refresh()
        viewModel.reloadTableView = {DispatchQueue.main.async {
            self.tableView.reloadData()
        }}
    }
    
    func configureTableView() {
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
        vc.savedCoctail = viewModel.models[indexPath.row]
        vc.controller = .favorite
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteFavoriteCocktail = UIContextualAction(style: .destructive,
                                         title: "Delete") { [weak self] a, b, c in
            guard let self = self else { return }
            self.viewModel.deleteCocktail(with: self.viewModel.models[indexPath.row].cocktailName ?? "")
            self.viewModel.refresh()
        }
        
        let swipeConfigure = UISwipeActionsConfiguration(actions: [deleteFavoriteCocktail])
        return swipeConfigure
    }
}
