import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchViewModelProtocol!
    var apiService: CocktailServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureViewModel()
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
    
    private func configureViewModel() {
        apiService = CocktailsApi()
        viewModel = SearchViewModel(apiService: apiService)
        viewModel.getCocktails(name: "Margarita")
        viewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cocktailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CoctailTableViewCell.self, for: indexPath)
        cell.configure(with: viewModel.cocktailArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CoctailInfo", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CoctailInfo") as! CoctailInfoViewController
        vc.coctail = viewModel.cocktailArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
