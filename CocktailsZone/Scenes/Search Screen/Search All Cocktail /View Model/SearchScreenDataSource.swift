//
//  SearchScreenDataSource.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import Foundation
import UIKit

typealias TableDataSource = UITableViewDataSource & UITableViewDelegate

class HomeTableDataSource: NSObject, TableDataSource {
    
    //MARK: - Variables
    
    private var tableView: UITableView
    private var navigationController: UINavigationController
    private var viewModel: SearchScreenViewModelProtocol!
    private var activityIndicator: UIActivityIndicatorView
    var itemList = [Cocktails]()
    
    //MARK: - Init
    
    required init(with tableView: UITableView, navigationController: UINavigationController, viewModel: SearchScreenViewModelProtocol, activityIndicator: UIActivityIndicatorView) {
        self.tableView = tableView
        self.navigationController = navigationController
        self.viewModel = viewModel
        self.activityIndicator = activityIndicator
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //MARK: - Functions
    
    func refresh(){
        itemList.removeAll()
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        viewModel.getCocktails(pagination: false) { [weak self] cocktails in
            self?.itemList = cocktails
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    func filterItemList(_ text: String){
        itemList.removeAll()
        viewModel.getCocktails(pagination: false) { [weak self] cocktails in
            
            self?.itemList = cocktails.filter{$0.name?.lowercased().contains(text.lowercased()) ?? false}
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
    
    //MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CoctailTableViewCell.self, for: indexPath)
//        if (indexPath.row + 1) % 4 == 0 {
//            cell.configure(with: itemList[indexPath.row], isFourth: true)
//        } else {
//            cell.configure(with: itemList[indexPath.row], isFourth: false)
//        }
        return cell
        
    }
    
    //MARK: - Delegate
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sb = UIStoryboard(name: "ProfileScreenViewController", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "ProfileScreenViewController") as! ProfileScreenViewController
//        vc.avatarImage = itemList[indexPath.row].avatarUrl
//        vc.name = itemList[indexPath.row].login
//        navigationController.pushViewController(vc, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == itemList.count - 1 {
            DispatchQueue.main.async {
                self.tableView.isScrollEnabled = false
                self.activityIndicator.startAnimating()
            }
            viewModel.getCocktails(pagination: true) { [weak self] cocktails in
                self?.itemList.append(contentsOf: cocktails)
                print(cocktails.count)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                    self?.tableView.isScrollEnabled = true
                }
            }
        }
        
    }
    
}
