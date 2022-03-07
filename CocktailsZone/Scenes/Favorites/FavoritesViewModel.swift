import UIKit

class FavoritesViewModel {
    
    var reloadTableView: (()->())?
    var models: [FavoritesData] = []
    
    func refresh() {
        let tempManager = ModelManager(with: PersistantManager())
        tempManager.getModels { [weak self] models in
            guard let self = self else { return }
            self.models = models ?? []
            self.reloadTableView?()
        }
    }
}
