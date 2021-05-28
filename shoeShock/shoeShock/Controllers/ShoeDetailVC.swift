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
    
    var shoe: Shoe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initShoe(shoe: shoe!)
    }
    
    func initShoe(shoe: Shoe) {
        
        updateViewController(shoe: shoe)
    }

    func updateViewController(shoe: Shoe){
        shoeName.text = shoe.name
        shoeImage.image = UIImage(named: "Nike\(shoe.number)")
        shoePrice.text = shoe.price
        shoeDescription.text = shoe.shoeDescription
    }

}
