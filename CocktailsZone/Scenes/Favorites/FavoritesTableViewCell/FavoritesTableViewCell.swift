import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    var isFavourite:Bool = true
    var favoritesCoctails: FavoritesData?
    
    func configure(with vm: FavoritesData) {
        cocktailNameLabel.text = vm.coctailName
        categoryLabel.text = vm.category
        cocktailImageView.image = UIImage(data: (vm.image ?? UIImage(named: "FirstSlide")?.pngData())!)
    }
}
