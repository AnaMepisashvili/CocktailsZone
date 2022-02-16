//
//  SearchViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//


import UIKit
//import Kingfisher

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    private var viewModel: SearchScreenViewModelProtocol!
    private var dataSource: HomeTableDataSource!
    var apiService: CocktailServiceProtocol!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configViewModel()
        searchBar.delegate = self
    }
    
    //MARK: - Functions
    private func setupLayout(){
        tableView.registerNib(class: CoctailTableViewCell.self)
    }
    
    private func configViewModel() {
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
