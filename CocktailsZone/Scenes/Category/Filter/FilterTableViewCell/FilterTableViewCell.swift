import UIKit

class FilterTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    func configure(with cocktail: Cocktail) {
        if let urlString = cocktail.cocktailImage {
            guard let url = URL(string: urlString) else {return}
            guard let data = try? Data(contentsOf: url) else {return}
            cocktailImage.image = UIImage(data: data)
        }
        cocktailNameLabel.text = cocktail.name
    }
}
