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
    
    func updateViews(shoe: Shoe, row: Int){
        brandName.text = shoe.brand
        shoeName.text = shoe.name
        shoePrice.text = shoe.price
        shoeImage.image = UIImage(named: "Nike\(row + 1)")
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    @IBAction func shoeHearted(_ sender: UIButton) {
        if let shoeName = shoeName.text {
            print(shoeName)
        }
    }
    
    
}
