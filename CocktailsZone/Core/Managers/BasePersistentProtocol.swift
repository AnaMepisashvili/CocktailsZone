import UIKit
import CoreData

protocol BasePersistentProtocol: AnyObject {
    var context: NSManagedObjectContext? { get }
}

extension BasePersistentProtocol {
    var context: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }
}
