//
//  FilterViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 19.02.22.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    func configTableView() {
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
