//
//  TopShoeCell.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import UIKit

class TopShoeCell: UICollectionViewCell {
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var shoeName: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var shoe: Shoe?
    var shoeSelected = false
    
    func updateViews(shoe: Shoe, row: Int){
        brandName.text = shoe.brand
        shoeName.text = shoe.name
        shoePrice.text = shoe.price
        shoeImage.image = UIImage(named: "Nike\(shoe.number)")
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        self.shoe = shoe
    }
    
    @IBAction func shoeHearted(_ sender: UIButton) {
        if !shoeSelected {
            if let shoe = self.shoe {
                CollectionService.collection.selectShoe(shoe: shoe )
            }
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        if shoeSelected {
            if let shoe = self.shoe {
                CollectionService.collection.removeSelectedShoe(shoe: shoe)
            }
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        shoeSelected.toggle()
        print(CollectionService.collection.getSelectedShoes().count)
    }
    
    
}
