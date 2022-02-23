import UIKit

//typealias CollectDataSource = UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

//class OnboardingViewModel: NSObject, CollectDataSource {
//    private var collectionView: UICollectionView!
//    private var rootController: OnboardingViewController!
//    private var slides: [OnboardingSlide]!
//    
//    init(with collectionView: UICollectionView,
//         slides: [OnboardingSlide],
//         rootController: OnboardingViewController) {
//        
//        super.init()
//        
//        self.collectionView = collectionView
//        self.rootController = rootController
//        self.slides = slides
//        
////        configureCollectionView()
//    }
    
//    func configureCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return slides.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
//        cell.setup(slides[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return  0
//    }
//}
