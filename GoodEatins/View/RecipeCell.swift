//
//  RecipeCell.swift
//  GoodEatins
//
//  Created by Faisal Babkoor on 10/1/18.
//  Copyright © 2018 Faisal Babkoor. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    @IBOutlet var recipeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.recipeImage.layer.cornerRadius = 10
        self.recipeImage.clipsToBounds = true
        self.recipeImage.layer.masksToBounds = true
    }
    
    func configureCell(recipe: Recipe){
        self.recipeImage.image = UIImage(named: recipe.imageName)
    }
}
