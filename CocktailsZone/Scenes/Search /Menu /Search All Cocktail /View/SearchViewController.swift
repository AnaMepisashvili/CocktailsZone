import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchScreenViewModelProtocol!
    private var dataSource: HomeTableDataSource!
    var apiService: CocktailServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
        searchBar.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        title = "Cocktails"
    }
    
    private func setupLayout() {
        tableView.registerNib(class: CoctailTableViewCell.self)
    }
    
    private func configureViewModel() {
        apiService = CocktailsInfoApi()
        viewModel = SearchScreenViewModel(apiService: apiService)
        dataSource = HomeTableDataSource(with: tableView, navigationController: navigationController!, viewModel: viewModel, activityIndicator: activityIndicator)
        dataSource.refresh()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            dataSource.refresh()
        } else {
            dataSource.filterItemList(searchText)
        }
    }
    
}
