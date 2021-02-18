//
//  SearchViewController.swift
//  FoodBook
//
//  Created by Rajesh Mehla on 17/02/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextfield: UITextField!
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    var foodItems: Array<FoodItemDetailModel?> = [], randomItem: FoodItemDetailModel?, searchFlag: Bool = false
    
    // MARK: - Customised Methods -
    
    @IBAction func searchFoodItems(_ sender: Any)-> Void {
        searchFlag = true
        searchTextfield.resignFirstResponder()
        let strSearch = searchTextfield?.text ?? ""
        
        let strUrl = Base_Url + Search_Url + strSearch
        let searchUrl = URL.init(string: strUrl)
        let manager = ConnectionManager()
        
        DispatchQueue.global(qos: .userInteractive).async {
            manager.connectionManagerGetUserData(url: searchUrl!, withDelegate: self, success: { (data) in
                do {
                    let itemsSummary = try JSONDecoder().decode(FoodItemModel.self, from: data)
                    print("Items: \(itemsSummary)")
                    
                    DispatchQueue.main.sync {
                        if let dataArray = itemsSummary.meals {
                            self.randomItem = dataArray.first
                            self.foodItems.removeAll()
                            self.foodItems.append(contentsOf: dataArray)
                            self.itemsTableView.isHidden = false
                            self.itemsTableView.reloadData()
                        }
                    }
                } catch {
                    let strError = error.localizedDescription
                    print("Catch: \(strError)")
                }
            } , failure: { (errorMessage) in
                let strError = errorMessage
                showAlertMessage(alertMsg: strError, currentVC: self)
            })
        }
    }
    
    func getRandomFoodItem()-> Void {
        let strUrl = Base_Url + Random_Url
        let randomUrl = URL.init(string: strUrl)
        
        let manager = ConnectionManager()
        
        DispatchQueue.global(qos: .userInteractive).async {
            manager.connectionManagerGetUserData(url: randomUrl!, withDelegate: self, success: { (data) in
                do {
                    let itemsSummary = try JSONDecoder().decode(FoodItemModel.self, from: data)
                    print("Random Item: \(itemsSummary)")
                    
                    DispatchQueue.main.sync {
                        if let dataArray = itemsSummary.meals {
                            self.foodItems.removeAll()
                            self.foodItems.append(contentsOf: dataArray)
                            self.itemsTableView.isHidden = false
                            self.itemsTableView.reloadData()
                        }
                    }
                } catch {
                    let strError = error.localizedDescription
                    print("Catch: \(strError)")
                }
            } , failure: { (errorMessage) in
                let strError = errorMessage
                showAlertMessage(alertMsg: strError, currentVC: self)
            })
        }
    }
    
    @objc func favouriteBtnAction(_ sender: Any) -> Void {
        let currentBtn = sender as! UIButton
        let currentCell = currentBtn.superview?.superview?.superview as! UITableViewCell
        let indexPath = itemsTableView.indexPath(for: currentCell)
        
        if let foodData = foodItems[indexPath!.row] {
            showActivityIndicator(container: (self.view)!)
            CoreDataManager.shareInstance.saveSelectedIFoodtem(idMeal: foodData.idMeal!, itemDetailDic: foodData, success: { (strMsg) in
                hideActivityIndicator()                                                
            })
        }
    }
    
    // MARK: - View Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchView!.setBorderNCornerRadiusOfView(color: searchBorderColor, borderWidth: 1, cornerRadius: 4)
        
        getRandomFoodItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

//:Mark - Textfield Delegate protocols

extension SearchViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text: NSString = (textField.text ?? "") as NSString
        let searchItemKey = text.replacingCharacters(in: range, with: string)
        
        if searchItemKey.count == 0 {
            searchFlag = false
            self.foodItems.removeAll()
            self.foodItems.append(self.randomItem)
            self.itemsTableView.reloadData()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//:Mark - Tableview Delegate and datasource protocols

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 308
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    
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
                
                let favouriteBtn = cell.viewWithTag(6) as! UIButton
                favouriteBtn.addTarget(self, action: #selector(favouriteBtnAction(_:)), for: .touchUpInside)
                favouriteBtn.layer.cornerRadius = 8.0
                favouriteBtn.isHidden = false
                if !searchFlag {
                    favouriteBtn.isHidden = true
                }
            }
        }
        return cell
    }
}

