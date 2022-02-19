//
//  OnboardingViewController.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 14.02.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    
    private var dataSource: OnboardingDataSource!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.layer.cornerRadius = 15
        nextButton.layer.cornerRadius = 15
        slides = [
            OnboardingSlide(image: "FirstSlide"),
            OnboardingSlide(image: "SecondSlide"),
            OnboardingSlide(image: "ThirdSlide")
        ]
        configViewModel()
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            moveToLoginScreen()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @IBAction func skipActionButton(_ sender: Any) {
        moveToLoginScreen()
    }
    
    func configViewModel() {
        dataSource = OnboardingDataSource(with: collectionView, with: slides, with: self)
    }
    
    func moveToLoginScreen() {
        let sb = UIStoryboard(name: "LoginViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


