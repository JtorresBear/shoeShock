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
        print("Sender value\(sender.value)")
        while count < CollectionService.instance.getSelectedShoes().count{
            if UWShoe.name == CollectionService.instance.getSelectedShoes()[count].shoe.name{
                CollectionService.instance.changeQuantity(of: count, number: stepperCount)
                if stepperCount == 0 {
                    CollectionService.instance.changeSelectedStatus(status: false, shoeSelected: UWShoe)
                    cartVC?.cartTable.deleteRows(at: [IndexPath(row: count, section: 0)], with: .fade)
                } else {
                    updateCell(shoe: CollectionService.instance.getSelectedShoes()[count].shoe, quantity: CollectionService.instance.getSelectedShoes()[count].quantity)
                }
                
            }
            count += 1
        }
        cartVC?.shoeTotalPrice()
        cartVC?.shoeTotalCount()
    }
    
}
