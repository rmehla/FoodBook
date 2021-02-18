//
//  CoreDataManager.swift
//  PKB
//
//  Created by Diwakar Bhandari on 05/07/19.
//  Copyright © 2019 Preeti Sharma. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {    
    static let shareInstance = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveSelectedIFoodtem(idMeal:String, itemDetailDic:FoodItemDetailModel, success:@escaping (_ strMsg:String) -> Void) {
        do {
            let foodItemArray = checkItemIsPresentInDatabase(predicate: NSPredicate(format: "idMeal = %@", idMeal))
//            let foodItemArr = checkItemIsPresentInDatabase(predicate: NSPredicate(format: "item_id = %d AND quantity = %@", itemId, itemDetailDic["itemQuantity"] ?? ""))
        //NSPredicate(format: "item_id = %d AND password = %@", itemId, txtPassword.text!)
            if foodItemArray.count > 0 {
                for foodItem in foodItemArray {
                    print("UPDATE DATA WITH ITEM ID \(idMeal)")
                    context.delete((foodItem as? NSManagedObject)!)
                    
                    print("DATA DELETE ITEM ID \(idMeal)")
//                    try context.save()
                }
            }
            let entity = NSEntityDescription.entity(forEntityName: "Food_Item", in: context)
            let foodItem = NSManagedObject(entity: entity!, insertInto: context)
            
            foodItem.setValue(itemDetailDic.idMeal, forKey: "idMeal")
            foodItem.setValue(itemDetailDic.strMeal, forKey: "strMeal")
            foodItem.setValue(itemDetailDic.strCategory, forKey: "strCategory")
            foodItem.setValue(itemDetailDic.strArea, forKey: "strArea")
            foodItem.setValue(itemDetailDic.strInstructions, forKey: "strInstructions")
            foodItem.setValue(itemDetailDic.strMealThumb, forKey: "strMealThumb")
            foodItem.setValue(itemDetailDic.strTags, forKey: "strTags")
            foodItem.setValue(itemDetailDic.strYoutube, forKey: "strYoutube")
            foodItem.setValue(itemDetailDic.strIngredient1, forKey: "strIngredient1")
            foodItem.setValue(itemDetailDic.strIngredient2, forKey: "strIngredient2")
            foodItem.setValue(itemDetailDic.strIngredient3, forKey: "strIngredient3")
            foodItem.setValue(itemDetailDic.strIngredient4, forKey: "strIngredient4")
            foodItem.setValue(itemDetailDic.strIngredient5, forKey: "strIngredient5")
            foodItem.setValue(itemDetailDic.strIngredient6, forKey: "strIngredient6")
            foodItem.setValue(itemDetailDic.strIngredient7, forKey: "strIngredient7")
            foodItem.setValue(itemDetailDic.strIngredient8, forKey: "strIngredient8")
            foodItem.setValue(itemDetailDic.strIngredient9, forKey: "strIngredient9")
            foodItem.setValue(itemDetailDic.strIngredient10, forKey: "strIngredient10")
            foodItem.setValue(itemDetailDic.strIngredient11, forKey: "strIngredient11")
            foodItem.setValue(itemDetailDic.strIngredient12, forKey: "strIngredient12")
            foodItem.setValue(itemDetailDic.strIngredient13, forKey: "strIngredient13")
            foodItem.setValue(itemDetailDic.strIngredient14, forKey: "strIngredient14")
            foodItem.setValue(itemDetailDic.strIngredient15, forKey: "strIngredient15")
            foodItem.setValue(itemDetailDic.strIngredient16, forKey: "strIngredient16")
            foodItem.setValue(itemDetailDic.strIngredient17, forKey: "strIngredient17")
            foodItem.setValue(itemDetailDic.strIngredient18, forKey: "strIngredient18")
            foodItem.setValue(itemDetailDic.strIngredient19, forKey: "strIngredient19")
            foodItem.setValue(itemDetailDic.strIngredient20, forKey: "strIngredient20")

            print("SAVE DATA WITH ITEM ID \(idMeal)")
            try context.save()
            success("Saved successfully")
//        print("foodItemArr  \(foodItemArr.0.count)")
        } catch {
            print("Failed saving")
        }
    }
    
    func checkItemIsPresentInDatabase(predicate: NSPredicate) -> ([Food_Item]) {
        var foodItem = [Food_Item]()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Food_Item")
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        //request.fetchLimit = 1
        
        do {
            let dataArray = try context.fetch(request)
            print("Data: \(dataArray)")
            foodItem = dataArray as! [Food_Item]
        } catch {
            print("Failed Fetching")
        }
        return (foodItem)
    }
    
    func resetAllRecords(in entity : String) {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }

    func fetchAllData() -> [Food_Item] {
        var foodItems  = [Food_Item]() // Where Locations = your NSManaged Class
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Food_Item")
        do {
//            foodItems = try context.fetch(fetchRequest) as! [Food_Item]
            let dataArray = try context.fetch(fetchRequest)
            print("Data: \(dataArray)")
            foodItems = dataArray as! [Food_Item]

        } catch {
            print("error")
        }
        return foodItems
    }
}
