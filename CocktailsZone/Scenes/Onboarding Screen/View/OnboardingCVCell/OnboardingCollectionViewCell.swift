//
//  OnboardingCollectionViewCell.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 14.02.22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = UIImage(named: slide.image ?? "")
    }
}
