import UIKit

class CocktailInfoViewController: UIViewController {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailInstructionLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    
    var coctail: CocktailInfo?
    var savedCoctail: FavoritesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillCoctailInfo()
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
    
    @IBAction func favoriteButton(_ sender: Any) {
        guard let model = coctail else { return }
        let tempManager = ModelManager(with: PersistantManager())
        tempManager.uploadModel(usingModel: model, image: (cocktailImage.image?.pngData())!) { bool in
        }
    }
}