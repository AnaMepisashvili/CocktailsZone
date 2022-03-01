import UIKit

class CocktailInfoViewController: UIViewController {
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var cocktailInstructionLabel: UILabel!
    @IBOutlet weak var cocktailImage: UIImageView!
    
    var coctail: CocktailInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillCoctailInfo()
    }
    
    override func viewDidLayoutSubviews() {
        cocktailImage.layer.cornerRadius = cocktailImage.bounds.width/2
    }
    
    func fillCoctailInfo() {
        cocktailNameLabel.text = coctail?.name
        cocktailInstructionLabel.text = coctail?.instruction
        categoryLabel.text = coctail?.category
//        categoryLabel.text = "Categrory: \(coctail?.category)"
        if  let url = URL(string: coctail?.cocktailImage ?? ""),
            let data = try? Data(contentsOf: url) {
            self.cocktailImage.image = UIImage(data: data)
        }
    }
}
