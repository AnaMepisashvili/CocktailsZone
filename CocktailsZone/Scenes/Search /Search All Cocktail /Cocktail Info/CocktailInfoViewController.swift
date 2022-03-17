import UIKit
import FirebaseAuth

class CocktailInfoViewController: UIViewController {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailInstructionLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var favoriteStarButton: UIButton!
    
    private var cocktailInfoViewModel = CocktailInfoViewModel()
    var isFavourite:Bool = true

    var coctail: CocktailInfo?
    var savedCoctail: FavoritesData?
    
    var controller: vc?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel(
        )
        if controller == .favorite{
            fillSavedCoctailInfo()
        } else {
            fillCoctailInfo()
        }
    }
    
    func setupViewModel() {
        cocktailInfoViewModel.getUser()
    }
    
    func fillCoctailInfo() {
        cocktailNameLabel.text = coctail?.name
        cocktailInstructionLabel.text = coctail?.instruction
        categoryLabel.text = coctail?.category
        
        if  let url = URL(string: coctail?.cocktailImage ?? ""),
            let data = try? Data(contentsOf: url) {
            self.cocktailImage.image = UIImage(data: data)
        }
    }
    
    func fillSavedCoctailInfo() {
        cocktailNameLabel.text = savedCoctail?.cocktailName
        cocktailInstructionLabel.text = savedCoctail?.instruction
        categoryLabel.text = savedCoctail?.category
        cocktailImage.image = UIImage(data: (savedCoctail?.image)!)
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        guard let model = coctail else { return }
        cocktailInfoViewModel.saveCoctailInfo(model: model, image: (cocktailImage.image?.pngData())!)
        
        if isFavourite {
            isFavourite = false
            favoriteStarButton.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            isFavourite = true
            favoriteStarButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favoriteStarButton.tintColor = UIColor(named: "#98D4D9")
        }
    }
}

enum vc {
    case favorite
    case other
}
