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
    
    func configure(with cocktail: Cocktail) {
        cocktailNameLabel.text = cocktail.name
        let url = URL(string: cocktail.avatarUrl!)
        let data = try? Data(contentsOf: url!)
        cocktailImage.image = UIImage(data: data!)
    }
}
