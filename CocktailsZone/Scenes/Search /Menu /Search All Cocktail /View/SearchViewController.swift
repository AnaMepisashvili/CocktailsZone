import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchScreenViewModelProtocol!
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
        searchBar.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        title = "Cocktails"
    }
    
    private func setupTableView() {
        tableView.registerNib(class: CoctailTableViewCell.self)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func configureViewModel() {
        apiService = CocktailsApi()
        viewModel = SearchScreenViewModel(apiService: apiService)
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
