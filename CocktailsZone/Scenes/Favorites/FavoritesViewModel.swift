import UIKit

class FavoritesViewModel {
    var reloadTableView: (()->())?
    var models: [FavoritesData] = []
    
    func refresh() {
        let tempManager = CoreDataManager()
        tempManager.getCoctailInfo { [weak self] models in
            guard let self = self else { return }
            self.models = models ?? []
            self.reloadTableView?()
        }
    }
}
