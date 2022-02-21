//
//  FavoritesViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    func configTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.registerNib(class: FavoritesTableViewCell.self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FavoritesTableViewCell.self, for: indexPath)
        return cell
    }
}
