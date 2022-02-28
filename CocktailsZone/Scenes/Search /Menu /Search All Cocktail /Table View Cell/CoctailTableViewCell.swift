import UIKit

class CoctailTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var favouriteStarButton: UIButton!
    @IBOutlet weak var cocktailImage: UIImageView!
    
    var isFavourite:Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        cocktailImage.layer.cornerRadius = 50
    }
    
    func configure(with cocktail: CocktailInfo) {
        cocktailNameLabel.text = cocktail.name
        categoryLabel.text = cocktail.category
        let url = URL(string: cocktail.cocktailImage!)
        let data = try? Data(contentsOf: url!)
        cocktailImage.image = UIImage(data: data!)
    }
    
    @IBAction func didTapStar(_ sender: Any) {
        if isFavourite {
            isFavourite = false
            favouriteStarButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            isFavourite = true
            favouriteStarButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favouriteStarButton.tintColor = UIColor(named: "#98D4D9")
        }
    }
}
