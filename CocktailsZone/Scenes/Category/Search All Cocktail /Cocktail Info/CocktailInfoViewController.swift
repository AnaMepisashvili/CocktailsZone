import UIKit
import FirebaseAuth

class CocktailInfoViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailInstructionTextView: UITextView!
    @IBOutlet weak var cocktailImage: UIImageView!
    @IBOutlet weak var cocktailInfoView: UIView!
    @IBOutlet weak var favoriteStarButton: UIButton!
    
    private var cocktailInfoViewModel = CocktailInfoViewModel()
    var isFavourite:Bool = true
    
    var coctail: CocktailInfo?
    var savedCoctail: FavoritesData?
    
    var controller: MoveCocktailInfoFrom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        cocktailInfoViewModel.checkIfSaved(cocktailName: coctail?.name ?? "")
        movedFrom()
        ifSaved()
    }
    
    override func viewWillLayoutSubviews() {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        cocktailInfoView.layer.mask = mask
    }
    
    func setupViewModel() {
        cocktailInfoViewModel.getUser()
    }
    
    func movedFrom() {
        if controller == .favorite {
            fillSavedCoctailInfo()
        } else {
            fillCoctailInfo()
        }
    }
    
    func fillCoctailInfo() {
        cocktailNameLabel.text = coctail?.name
        cocktailInstructionTextView.text = coctail?.instruction
        categoryLabel.text = coctail?.category
        
        if  let url = URL(string: coctail?.cocktailImage ?? ""),
            let data = try? Data(contentsOf: url) {
            self.cocktailImage.image = UIImage(data: data)
        }
    }
    
    func fillSavedCoctailInfo() {
        favoriteStarButton.isHidden = true
        cocktailNameLabel.text = savedCoctail?.cocktailName
        cocktailInstructionTextView.text = savedCoctail?.instruction
        categoryLabel.text = savedCoctail?.category
        cocktailImage.image = UIImage(data: (savedCoctail?.image)!)
    }
    
    func ifSaved() {
        if cocktailInfoViewModel.isSaved{
            favoriteStarButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteStarButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        guard let model = coctail else { return }
        
        if isFavourite {
            favoriteStarButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            cocktailInfoViewModel.saveCoctailInfo(model: model, image: (cocktailImage.image?.pngData())!)
            isFavourite = false
        } else {
            favoriteStarButton.setImage(UIImage(systemName: "star"), for: .normal)
            favoriteStarButton.tintColor = UIColor(named: "#98D4D9")
            cocktailInfoViewModel.deleteCoctailInfo(cocktailName: model.name ?? "")
            isFavourite = true
        }
    }
}
