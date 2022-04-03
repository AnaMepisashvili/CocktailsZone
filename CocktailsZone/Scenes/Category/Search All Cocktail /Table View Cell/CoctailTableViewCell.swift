import UIKit

class CoctailTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
        
    func configure(with cocktail: CocktailInfo) {
        if let urlString = cocktail.cocktailImage {
            guard let url = URL(string: urlString) else {return}
            guard let data = try? Data(contentsOf: url) else {return}
            cocktailImage.image = UIImage(data: data)
        }
        cocktailNameLabel.text = cocktail.name
        categoryLabel.text = cocktail.category
    }
}
