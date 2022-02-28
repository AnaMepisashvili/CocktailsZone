import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var favouriteStarButton: UIButton!
    
    var isFavourite:Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
