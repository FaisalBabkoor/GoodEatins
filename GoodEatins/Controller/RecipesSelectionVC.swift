//
//  RecipesSelectionVC.swift
//  GoodEatins
//
//  Created by Faisal Babkoor on 9/30/18.
//  Copyright © 2018 Faisal Babkoor. All rights reserved.
//

import UIKit

class RecipesSelectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    

    @IBOutlet var collectionView: UICollectionView!
    var data = DataSet()
    var foodsname: String?
    var recipes = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(titles ?? "" )
        collectionView.delegate = self
        collectionView.dataSource = self
        
        data.getRecipes(forCategoryTitle: foodsname ?? "") { (recipe) in
            self.recipes = recipe
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "new", for: indexPath) as? RecipeCell{
            let recipe = recipes[indexPath.item]
            cell.configureCell(recipe: recipe)
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let cellDimention = (width / 2) - 15
        return CGSize(width: cellDimention, height: cellDimention)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let recipeDetailsVC = storyboard?.instantiateViewController(withIdentifier: "RecipeDetailsVC") as? RecipeDetailsVC else {return}
        let recipe = recipes[indexPath.item]
        recipeDetailsVC.selectedRecipe = recipe
        navigationController?.pushViewController(recipeDetailsVC, animated: true)
    }
}
