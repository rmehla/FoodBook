//
//  FoodItem.swift
//  FoodBook
//
//  Created by Rajesh Mehla on 17/02/21.
//

import Foundation

struct FoodItemModel: Codable {
    var status: Bool?
    var msg: String?
    var meals: [FoodItemDetailModel]?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            // status Key
            self.status = try container.decodeIfPresent(Bool.self, forKey: .status)
            
            // msg Key
            self.msg = try container.decodeIfPresent(String.self, forKey: .msg)
            
            // data Key
            self.meals = try container.decodeIfPresent([FoodItemDetailModel].self, forKey: .meals)
        } catch DecodingError.typeMismatch {
        }
    }
}

struct FoodItemDetailModel: Codable {
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var strSource: String?
    var dateModified: String?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            // idMeal Key
            self.idMeal = try container.decodeIfPresent(String.self, forKey: .idMeal)
            
            // strMeal Key
            self.strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
            
            // strDrinkAlternate Key
            self.strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
            
            // strCategory Key
            self.strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory)
            
            // strArea Key
            self.strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
            
            // strInstructions Key
            self.strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
            
            // strMealThumb Key
            self.strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
            
            // strTags Key
            self.strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
            
            // strYoutube Key
            self.strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
            
            // strIngredient1 Key
            self.strIngredient1 = try container.decodeIfPresent(String.self, forKey: .strIngredient1)
            
            // strIngredient2 Key
            self.strIngredient2 = try container.decodeIfPresent(String.self, forKey: .strIngredient2)
            
            // strIngredient3 Key
            self.strIngredient3 = try container.decodeIfPresent(String.self, forKey: .strIngredient3)
            
            // strIngredient4 Key
            self.strIngredient4 = try container.decodeIfPresent(String.self, forKey: .strIngredient4)
            
            // strIngredient5 Key
            self.strIngredient5 = try container.decodeIfPresent(String.self, forKey: .strIngredient5)
            
            // strIngredient6 Key
            self.strIngredient6 = try container.decodeIfPresent(String.self, forKey: .strIngredient6)
            
            // strIngredient7 Key
            self.strIngredient7 = try container.decodeIfPresent(String.self, forKey: .strIngredient7)
            
            // strIngredient8 Key
            self.strIngredient8 = try container.decodeIfPresent(String.self, forKey: .strIngredient8)
            
            // strIngredient9 Key
            self.strIngredient9 = try container.decodeIfPresent(String.self, forKey: .strIngredient9)
            
            // strIngredient10 Key
            self.strIngredient10 = try container.decodeIfPresent(String.self, forKey: .strIngredient10)
            
            // strIngredient11 Key
            self.strIngredient11 = try container.decodeIfPresent(String.self, forKey: .strIngredient11)
            
            // strIngredient12 Key
            self.strIngredient12 = try container.decodeIfPresent(String.self, forKey: .strIngredient12)
            
            // strIngredient13 Key
            self.strIngredient13 = try container.decodeIfPresent(String.self, forKey: .strIngredient13)
            
            // strIngredient14 Key
            self.strIngredient14 = try container.decodeIfPresent(String.self, forKey: .strIngredient14)
            
            // strIngredient15 Key
            self.strIngredient15 = try container.decodeIfPresent(String.self, forKey: .strIngredient15)
            
            // strIngredient16 Key
            self.strIngredient16 = try container.decodeIfPresent(String.self, forKey: .strIngredient16)
            
            // strIngredient17 Key
            self.strIngredient17 = try container.decodeIfPresent(String.self, forKey: .strIngredient17)
            
            // strIngredient18 Key
            self.strIngredient18 = try container.decodeIfPresent(String.self, forKey: .strIngredient18)
            
            // strIngredient19 Key
            self.strIngredient19 = try container.decodeIfPresent(String.self, forKey: .strIngredient19)
            
            // strIngredient20 Key
            self.strIngredient20 = try container.decodeIfPresent(String.self, forKey: .strIngredient20)
            
            // strMeasure1 Key
            self.strMeasure1 = try container.decodeIfPresent(String.self, forKey: .strMeasure1)
            
            // strMeasure2 Key
            self.strMeasure2 = try container.decodeIfPresent(String.self, forKey: .strMeasure2)
            
            // strMeasure3 Key
            self.strMeasure3 = try container.decodeIfPresent(String.self, forKey: .strMeasure3)
            
            // strMeasure4 Key
            self.strMeasure4 = try container.decodeIfPresent(String.self, forKey: .strMeasure4)
            
            // strMeasure5 Key
            self.strMeasure5 = try container.decodeIfPresent(String.self, forKey: .strMeasure5)
            
            // strMeasure6 Key
            self.strMeasure6 = try container.decodeIfPresent(String.self, forKey: .strMeasure6)
            
            // strMeasure7 Key
            self.strMeasure7 = try container.decodeIfPresent(String.self, forKey: .strMeasure7)
            
            // strMeasure8 Key
            self.strMeasure8 = try container.decodeIfPresent(String.self, forKey: .strMeasure8)
            
            // strMeasure9 Key
            self.strMeasure9 = try container.decodeIfPresent(String.self, forKey: .strMeasure9)
            
            // strMeasure10 Key
            self.strMeasure10 = try container.decodeIfPresent(String.self, forKey: .strMeasure10)
            
            // strMeasure11 Key
            self.strMeasure11 = try container.decodeIfPresent(String.self, forKey: .strMeasure11)
            
            // strMeasure12 Key
            self.strMeasure12 = try container.decodeIfPresent(String.self, forKey: .strMeasure12)
            
            // strMeasure13 Key
            self.strMeasure13 = try container.decodeIfPresent(String.self, forKey: .strMeasure13)
            
            // strMeasure14 Key
            self.strMeasure14 = try container.decodeIfPresent(String.self, forKey: .strMeasure14)
            
            // strMeasure15 Key
            self.strMeasure15 = try container.decodeIfPresent(String.self, forKey: .strMeasure15)
            
            // strMeasure16 Key
            self.strMeasure16 = try container.decodeIfPresent(String.self, forKey: .strMeasure16)
            
            // strMeasure17 Key
            self.strMeasure17 = try container.decodeIfPresent(String.self, forKey: .strMeasure17)
            
            // strMeasure18 Key
            self.strMeasure18 = try container.decodeIfPresent(String.self, forKey: .strMeasure18)
            
            // strMeasure19 Key
            self.strMeasure19 = try container.decodeIfPresent(String.self, forKey: .strMeasure19)
            
            // strMeasure20 Key
            self.strMeasure20 = try container.decodeIfPresent(String.self, forKey: .strMeasure20)
            
            // strSource Key
            self.strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
            
            // dateModified Key
            self.dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        } catch DecodingError.typeMismatch {
        }
    }
}
