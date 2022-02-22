//
//  CoctailTableViewCell.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import UIKit

class CoctailTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cocktailImage.layer.cornerRadius = 50
    }
    
    func configure(with userItem: Cocktails, isFourth: Bool) {
        cocktailNameLabel.text = userItem.name
        let url = URL(string: userItem.avatarUrl!)
        let data = try? Data(contentsOf: url!)
        cocktailImage.image = UIImage(data: data!)
    }
}
