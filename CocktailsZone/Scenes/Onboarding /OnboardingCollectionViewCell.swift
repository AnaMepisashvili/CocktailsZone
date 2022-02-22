import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = UIImage(named: slide.image ?? "")
    }
}
