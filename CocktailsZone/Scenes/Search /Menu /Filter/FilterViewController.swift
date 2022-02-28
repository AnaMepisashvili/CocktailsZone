import UIKit

class FilterViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: FilterModelProtocol!
    
    var alcoholApiService: AlcoholServiceProtocol!
    var nonAlcoholApiService: NonAlcoholServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configureTableView()
        configureNavigationController()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        title = "Filter"
    }
    
    func configureNavigationController() {
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor(named: "#98D4D9")
    }
    
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.registerNib(class: FilterTableViewCell.self)
    }
    
    private func configureViewModel() {
        alcoholApiService = AlcoholApi()
        nonAlcoholApiService = NonAlcoholApi()
        
        viewModel = FilterViewModel(alcoholApiService: alcoholApiService, nonAlcoholApiService: nonAlcoholApiService)
        viewModel.reloadTableView = {
            DispatchQueue.main.async { self.tableView.reloadData()
            }
        }
        viewModel.getCocktail()
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.tableView.reloadData()
        case 1:
            self.tableView.reloadData()
        default: break
        }
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return viewModel.alcoholArray.count
        case 1:
            return viewModel.nonAlcoholArray.count
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FilterTableViewCell.self, for: indexPath)
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            cell.configure(with: viewModel.alcoholArray[indexPath.row])
        case 1:
            cell.configure(with: viewModel.nonAlcoholArray[indexPath.row])
        default:
            break
        }
        return cell
    }
}
