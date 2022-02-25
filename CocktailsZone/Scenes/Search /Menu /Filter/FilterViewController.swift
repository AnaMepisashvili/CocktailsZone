import UIKit

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FilterTableViewCell.self, for: indexPath)
        return cell
    }
}
