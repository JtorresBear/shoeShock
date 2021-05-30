//
//  CartCell.swift
//  shoeShock
//
//  Created by Juan Torres on 5/25/21.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeName: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var shoeQuantity: UILabel!
    
    var selectedShoe: Shoe?
    var cartVC: CartVC?
    var stepperCount = 1.0

    func updateCell(shoe: Shoe, quantity: Double){
        shoeName.text   = shoe.name
        shoeImage.image = UIImage(named: "Nike\(shoe.number)")
        shoeQuantity.text = String(quantity)
        stepperCount = quantity
        stepper.value = stepperCount
        shoePrice.text  = "$\(shoe.price * stepperCount)0"
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let UWShoe = selectedShoe else {return}
        stepperCount = sender.value
        var count = 0
        while count < CollectionService.collection.getSelectedShoes().count{
            if UWShoe.name == CollectionService.collection.getSelectedShoes()[count].shoe.name{
                CollectionService.collection.changeQuantity(of: count, number: stepperCount)
                updateCell(shoe: CollectionService.collection.getSelectedShoes()[count].shoe, quantity: CollectionService.collection.getSelectedShoes()[count].quantity)
            }
            count += 1
        }
        
        cartVC?.shoeTotalPrice()
    }
    
}
