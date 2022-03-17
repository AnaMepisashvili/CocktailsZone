import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    var isFavourite:Bool = true
    var favoritesCoctails: FavoritesData?
    
    func configure(with viewModel: FavoritesData) {
        cocktailNameLabel.text = viewModel.cocktailName
        categoryLabel.text = viewModel.category
        cocktailImageView.image = UIImage(data: (viewModel.image ?? UIImage(named: "FirstSlide")?.pngData())!)
    }
}
