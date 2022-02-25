import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchViewModelProtocol!
    var apiService: CocktailServiceProtocol!
    var cocktailArray: [CocktailInfo] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureViewModel()
        configureNavigationController()
        searchBar.delegate = self
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
        viewModel.getCocktails(name: "Margarita") { cocktails in
            self.cocktailArray.append(contentsOf: cocktails)
        }
        viewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CoctailTableViewCell.self, for: indexPath)
        cell.configure(with: cocktailArray[indexPath.row])
        return cell
    }
}
