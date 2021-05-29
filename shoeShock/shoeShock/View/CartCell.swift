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

    func updateCell(shoe: Shoe, quantity: Double){
        shoeName.text   = shoe.name
        shoePrice.text  = "$\(shoe.price)0"
        shoeImage.image = UIImage(named: "Nike\(shoe.number)")
        shoeQuantity.text = String(quantity)
    }
}
