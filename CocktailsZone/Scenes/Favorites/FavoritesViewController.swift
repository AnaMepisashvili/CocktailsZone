import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "You Haven't Favourite Cocktails Yet!"
        label.textColor = UIColor(named: "#98D4D9")
        return label
    }()
    
    var viewModel: FavoritesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        configureViewModel()
        configureTableView()
        hideLabbelMessage()
        configureNavigationController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.center = view.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.refresh()
        hideLabbelMessage()
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
    
    func hideLabbelMessage() {
        if !viewModel.favouriteCocktail.isEmpty {
            label.isHidden = true
        } else {
            label.isHidden = false
        }
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
        viewModel.favouriteCocktail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell") as? FavoritesTableViewCell
        cell?.configure(with: viewModel.favouriteCocktail[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "CocktailInfo", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "CocktailInfo") as? CocktailInfoViewController else {return}
        vc.savedCoctail = viewModel.favouriteCocktail[indexPath.row]
        vc.controller = .favorite
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteFavoriteCocktail = UIContextualAction(style: .destructive,
                                                        title: "Delete") { [weak self] a, b, c in
            guard let self = self else { return }
            self.viewModel.deleteCocktail(with: self.viewModel.favouriteCocktail[indexPath.row].cocktailName ?? "")
            self.viewModel.refresh()
            self.hideLabbelMessage() 
        }
        
        let swipeConfigure = UISwipeActionsConfiguration(actions: [deleteFavoriteCocktail])
        return swipeConfigure
    }
}
