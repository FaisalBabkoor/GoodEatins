//
//  CategoryCell.swift
//  GoodEatins
//
//  Created by Faisal Babkoor on 9/30/18.
//  Copyright © 2018 Faisal Babkoor. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet var categoryTitle: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImage.layer.cornerRadius = 10
    }

    func configureCell(withFoodCategory category: FoodCategory){
        self.categoryTitle.text = category.title
        self.categoryImage.image = UIImage(named: category.imageName)
        
    }
    
    
}
