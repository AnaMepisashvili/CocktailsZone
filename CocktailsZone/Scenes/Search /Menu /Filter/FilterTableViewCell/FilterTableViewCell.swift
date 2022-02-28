import UIKit

class FilterTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cocktailImage.layer.cornerRadius = 50
    }
    
    func configure(with cocktail: Cocktail) {
        cocktailNameLabel.text = cocktail.name
        let url = URL(string: cocktail.cocktailImage!)
        let data = try? Data(contentsOf: url!)
        cocktailImage.image = UIImage(data: data!)
    }
}
