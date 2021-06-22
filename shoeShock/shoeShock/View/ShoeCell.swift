//
//  TopShoeCell.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import UIKit

class ShoeCell: UICollectionViewCell {
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var shoeName: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    
    
    func updateViews(shoe: Shoe, row: Int){
        brandName.text = shoe.brand
        shoeName.text = shoe.name
        shoePrice.text = "$\(shoe.price)0"
        shoeImage.image = UIImage(named: "Nike\(shoe.number)")
        heartButton.setImage(UIImage(systemName: shoe.selected ? "heart.fill": "heart"), for: .normal)
        self.shoe = shoe
    }
    
    @IBAction func shoeHearted(_ sender: UIButton) {
        
        if !shoe!.selected {
            if let shoe = self.shoe {
                self.shoe!.selected = true
                CollectionService.instance.selectShoe(shoe: shoe, quantity: 1.0 )
                CollectionService.instance.changeSelectedStatus(status: true, shoeSelected: shoe)
            }
        }
        else if shoe!.selected {
            if let shoe = self.shoe {
                self.shoe!.selected = false
                CollectionService.instance.removeSelectedShoe(shoe: shoe)
                CollectionService.instance.changeSelectedStatus(status: false, shoeSelected: shoe)
            }
        }
        updateViews(shoe: self.shoe!, row: self.shoe!.number)
        print(CollectionService.instance.getSelectedShoes().count)
    }
    
    
}
