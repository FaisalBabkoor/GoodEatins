//
//  RecipeDetailsVC.swift
//  GoodEatins
//
//  Created by Faisal Babkoor on 10/2/18.
//  Copyright © 2018 Faisal Babkoor. All rights reserved.
//

import UIKit

class RecipeDetailsVC: UIViewController {

    @IBOutlet var racipeImage: UIImageView!
    @IBOutlet var racipeTitle: UILabel!
    @IBOutlet var racipeInstructions: UITextView!


    var selectedRecipe: Recipe?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.racipeImage.layer.cornerRadius = 5
        guard let selectedRecipe = selectedRecipe else {return}
        self.racipeImage.image = UIImage(named: selectedRecipe.imageName)
        
        self.racipeTitle.text = selectedRecipe.title
        self.racipeInstructions.text = selectedRecipe.instructions
    }
    

 
    

}
