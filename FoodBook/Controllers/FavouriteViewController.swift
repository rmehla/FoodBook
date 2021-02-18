//
//  FavouriteViewController.swift
//  FoodBook
//
//  Created by Rajesh Mehla on 17/02/21.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var itemsTableView: UITableView!

    var foodItems: Array<Food_Item?> = []
    
    // MARK: - Customised Methods -

    func fetchFavouriteItems () {
        let dataArray = CoreDataManager.shareInstance.fetchAllData()
        
        self.foodItems.removeAll()
        self.foodItems.append(contentsOf: dataArray)
        if self.foodItems.count > 0 {
            self.itemsTableView.reloadData()
        }
    }
    
    // MARK: - View Life Cycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavouriteItems()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

extension FavouriteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 308
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FavouriteViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        if foodItems.count > 0 {
            if let foodDict = foodItems[indexPath.row] {
                let shadowView = cell.viewWithTag(1)
                shadowView?.setShadow()
                
                let foodImageview = cell.viewWithTag(2) as! UIImageView
                foodImageview.setBorderNCornerRadiusOfView(color: UIColor.clear, borderWidth: 0, cornerRadius: 3)
                
                if let strImage = foodDict.strMealThumb {
                    foodImageview.downloadImagefrom(imageUrl: strImage) { (foodImage) in
                        DispatchQueue.main.async {
                            foodImageview.image = foodImage
                        }                        
                    }
                }

                let itemLbl = cell.viewWithTag(3) as! UILabel
                itemLbl.text = foodDict.strMeal?.capitalized
                
                let categoryLbl = cell.viewWithTag(4) as! UILabel
                
                var category = ""
                if let foodTag = foodDict.strTags {
                    category = foodTag
                }
                
                if category.count == 0 {
                    if let strTemp = foodDict.strCategory {
                        category = strTemp
                    }
                    if let area = foodDict.strArea {
                        if category.count == 0 {
                            category = area
                        } else {
                            category = category + ", " + area
                        }
                    }
                }
                categoryLbl.text = category

                let ingredientsLbl = cell.viewWithTag(5) as! UILabel
                var ingredients = ""
                if let strIngredient1 = foodDict.strIngredient1 {
                    ingredients = strIngredient1
                }
                
                if let ingredient = foodDict.strIngredient2 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient3 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient4 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient5 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient6 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient7 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient8 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient9 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient10 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient11 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient12 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient13 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient14 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient15 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient16 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient17 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient18 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient19 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                if let ingredient = foodDict.strIngredient20 {
                    if ingredients.count > 0 {
                        ingredients = ingredients + ", " + ingredient
                    } else {
                        ingredients = ingredient
                    }
                }
                ingredientsLbl.text = ingredients
            }
        }
        return cell
    }
}

