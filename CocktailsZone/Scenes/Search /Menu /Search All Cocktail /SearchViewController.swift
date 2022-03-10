import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchViewModelProtocol!
    var apiService: CocktailServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        configureNavigationController()
    }
    
    override func viewWillLayoutSubviews() {
        title = "Cocktails"
    }
    
    func configureNavigationController() {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(named: "#98D4D9")
    }
    
    private func setupTableView() {
        tableView.registerNib(class: CoctailTableViewCell.self)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cocktailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CoctailTableViewCell.self, for: indexPath)
        cell.configure(with: viewModel.cocktailArray[indexPath.row])
        cell.favorite = {}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CocktailInfo", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CocktailInfo") as! CocktailInfoViewController
        vc.coctail = viewModel.cocktailArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            setupTableView()
            apiService = CocktailsApi()
            viewModel = SearchViewModel(apiService: apiService)
            viewModel.getCocktails(name: searchText)
            viewModel.reloadTableView = {
                DispatchQueue.main.async { self.tableView.reloadData() }
            }
        }
    }
}
