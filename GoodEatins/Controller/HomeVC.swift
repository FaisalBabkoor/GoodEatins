//
//  ViewController.swift
//  GoodEatins
//
//  Created by Faisal Babkoor on 9/29/18.
//  Copyright © 2018 Faisal Babkoor. All rights reserved.
//

import UIKit
let categoryCell = "CategoryCell"
class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let data = DataSet()
    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: categoryCell, for: indexPath) as? CategoryCell{
            let category = data.categories[indexPath.row]
            cell.configureCell(withFoodCategory: category)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipesSelectionVC = storyboard?.instantiateViewController(withIdentifier: "RecipesSelectionVC") as? RecipesSelectionVC else {return}
        let category = data.categories[indexPath.row]
        recipesSelectionVC.foodsname = category.title
        navigationController?.pushViewController(recipesSelectionVC, animated: true)
    }
    
}

