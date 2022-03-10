import CoreData
import UIKit

protocol CoreDataManagerProtocol: BasePersistentProtocol {
    func getCoctailInfo(completion: @escaping ([FavoritesData]?) -> Void)
}

final class CoreDataManager: CoreDataManagerProtocol {
    var modelObject: NSManagedObject? {
        guard let context = context else { return nil }
        guard let description = NSEntityDescription.entity(forEntityName: "FavoritesData", in: context) else { return nil }
        let obj = NSManagedObject(entity: description, insertInto: context)
        return obj
    }
    //user: UserData,
    func saveCoctailInfo(usingModel model: CocktailInfo, image: Data, completion: @escaping (Bool) -> Void) {
        guard let context = context else { return }
        
        let saveCoctailInfo = FavoritesData(context: context)
        saveCoctailInfo.cocktailName = model.name
        saveCoctailInfo.category = model.category
        saveCoctailInfo.instruction = model.instruction
        saveCoctailInfo.image = image
        //        saveCoctailInfo.user = user
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func getCoctailInfo(completion: @escaping ([FavoritesData]?) -> Void) {
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
    
    func deleteCoctailInfo(usingModel model: FavoritesData, completion: @escaping (Bool) -> Void) {
        guard let context = context else { return }
        
        do {
            let request = NSFetchRequest<FavoritesData>(entityName: "FavoritesData")
            let result = try context.fetch(request)
            
            result.forEach {
                if $0.cocktailName == model.cocktailName {
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
    
    func saveUser(user: UserInfo, completion: @escaping (UserData) -> Void) {
        guard let context = context else { return }
        
        let savedUser = UserData(context: context)
        savedUser.password = user.password
        savedUser.email = user.email
        savedUser.username = user.username
        savedUser.userID = user.userID
        savedUser.number = user.number
        
        do {
            try context.save()
            completion(savedUser)
        } catch {
            print(error)
        }
    }
    
    func getUser(user: UserData, completion: @escaping ([UserData]?) -> Void) {
        guard let context = context else { return }
        
        do {
            let request = NSFetchRequest<UserData>(entityName: "UserData")
            let user = try context.fetch(request)
            
            completion(user)
        } catch {
            print(error)
            completion(nil)
        }
    }
}
