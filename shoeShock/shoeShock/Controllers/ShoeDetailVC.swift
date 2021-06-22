//
//  ShoeDetailVC.swift
//  shoeShock
//
//  Created by Juan Torres on 5/25/21.
//

import UIKit

class ShoeDetailVC: UIViewController {

    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeDescription: UILabel!
    @IBOutlet weak var shoeName: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var shoe: Shoe?
    var stepperCount = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initShoe(shoe: shoe!)
        quantityLabel.text = quantityStepper.stepValue.description
        
    }
    
    func initShoe(shoe: Shoe) {
        
        updateViewController(shoe: shoe)
    }

    func updateViewController(shoe: Shoe){
        shoeName.text = shoe.name
        shoeImage.image = UIImage(named: "Nike\(shoe.number)")
        shoePrice.text = "$\(shoe.price)0"
        shoeDescription.text = shoe.shoeDescription
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
        guard let shoe = self.shoe, let quantity = Double(quantityLabel.text!) else {return}
        CollectionService.instance.selectShoeFromDetail(shoe: shoe, quantity: quantity)
        CollectionService.instance.changeSelectedStatus(status: true, shoeSelected: shoe)
        print(CollectionService.instance.getSelectedShoes().count)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        quantityLabel.text = String(sender.value)
        stepperCount = sender.value
        guard let price = shoe?.price else {return}
        let currentPrice = price * stepperCount
        shoePrice.text = "$\(currentPrice)0"
    }
}
