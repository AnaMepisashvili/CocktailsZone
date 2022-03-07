//
//  FavoritesData+CoreDataProperties.swift
//  
//
//  Created by Ana Mepisashvili on 07.03.22.
//
//

import Foundation
import CoreData


extension FavoritesData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesData> {
        return NSFetchRequest<FavoritesData>(entityName: "FavoritesData")
    }

    @NSManaged public var image: Data?
    @NSManaged public var coctailName: String?
    @NSManaged public var category: String?
    @NSManaged public var instruction: String?

}
