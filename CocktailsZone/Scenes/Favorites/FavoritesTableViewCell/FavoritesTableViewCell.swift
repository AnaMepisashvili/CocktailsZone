import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var favouriteStarButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    
    var isFavourite:Bool = true
    var favoritesCoctails: FavoritesData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with vm: FavoritesData) {
        cocktailNameLabel.text = vm.coctailName
        categoryLabel.text = vm.category
        cocktailImageView.image = UIImage(data: (vm.image ?? UIImage(named: "FirstSlide")?.pngData())!)
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
