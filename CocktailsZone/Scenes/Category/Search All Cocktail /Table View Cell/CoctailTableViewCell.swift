import UIKit

class CoctailTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
        
    func configure(with cocktail: CocktailInfo) {
        cocktailNameLabel.text = cocktail.name
        categoryLabel.text = cocktail.category
        let url = URL(string: cocktail.cocktailImage!)
        let data = try? Data(contentsOf: url!)
        cocktailImage.image = UIImage(data: data!)
    }
}