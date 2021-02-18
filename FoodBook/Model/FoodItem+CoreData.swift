//
//  FoodItem+CoreData.swift
//  FoodBook
//
//  Created by Rajesh Mehla on 18/02/21.
//

import Foundation
import CoreData

@objc(Food_Item)
public class Food_Item: NSManagedObject {
}
 
extension Food_Item {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food_Item> {
        return NSFetchRequest<Food_Item>(entityName: "Item")
    }
    
    @NSManaged public var idMeal: String?
    @NSManaged public var strMeal: String?
    @NSManaged public var strCategory: String?
    @NSManaged public var strArea: String?
    @NSManaged public var strInstructions: String?
    @NSManaged public var strMealThumb: String?
    @NSManaged public var strTags: String?
    @NSManaged public var strYoutube: String?
    @NSManaged public var strIngredient1: String?
    @NSManaged public var strIngredient2: String?
    @NSManaged public var strIngredient3: String?
    @NSManaged public var strIngredient4: String?
    @NSManaged public var strIngredient5: String?
    @NSManaged public var strIngredient6: String?
    @NSManaged public var strIngredient7: String?
    @NSManaged public var strIngredient8: String?
    @NSManaged public var strIngredient9: String?
    @NSManaged public var strIngredient10: String?
    @NSManaged public var strIngredient11: String?
    @NSManaged public var strIngredient12: String?
    @NSManaged public var strIngredient13: String?
    @NSManaged public var strIngredient14: String?
    @NSManaged public var strIngredient15: String?
    @NSManaged public var strIngredient16: String?
    @NSManaged public var strIngredient17: String?
    @NSManaged public var strIngredient18: String?
    @NSManaged public var strIngredient19: String?
    @NSManaged public var strIngredient20: String?
}
