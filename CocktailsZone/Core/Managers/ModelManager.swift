import CoreData

protocol ModelManagerProtocol: BasePersistentProtocol {
    func getModels(completion: @escaping ([FavoritesData]?) -> Void)
    init(with persistent: PersistentManagerProtocol)
}

final class ModelManager: ModelManagerProtocol {
    var persistent: PersistentManagerProtocol!
    
    var modelObject: NSManagedObject? {
        guard let context = context else { return nil }
        guard let description = NSEntityDescription.entity(forEntityName: "FavoritesData", in: context) else { return nil }
        let obj = NSManagedObject(entity: description, insertInto: context)
        return obj
    }
    
    func uploadModel(usingModel model: CocktailInfo, image: Data, completion: @escaping (Bool) -> Void) {
        guard let context = context else { return }
        
        let uploadModel = FavoritesData(context: context)
        uploadModel.coctailName = model.name
        uploadModel.category = model.category
        uploadModel.instruction = model.instruction
        uploadModel.image = image
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func getModels(completion: @escaping ([FavoritesData]?) -> Void) {
        guard let context = context else { return }
        
        do {
            let request = NSFetchRequest<FavoritesData>(entityName: "FavoritesData")
            let models = try context.fetch(request)
            
            completion(models)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    func clear() {
        guard let context = context else { return }
        let request = NSFetchRequest<FavoritesData>(entityName: "FavoritesData")
        
        do {
            let entities = try context.fetch(request)
            entities.forEach {
                context.delete($0)
            }
        } catch {
            print(error)
        }
    }
    
    func deleteModel(usingModel model: FavoritesData, completion: @escaping (Bool) -> Void) {
        guard let context = context else { return }
        
        do {
            let request = NSFetchRequest<FavoritesData>(entityName: "FavoritesData")
            let result = try context.fetch(request)
            
            result.forEach {
                if $0.coctailName == model.coctailName {
                    context.delete($0)
                    completion(true)
                }
            }
            try context.save()
        } catch {
            completion(false)
            print(error)
        }
    }
    
    init(with persistent: PersistentManagerProtocol) {
        self.persistent = persistent
    }
}
