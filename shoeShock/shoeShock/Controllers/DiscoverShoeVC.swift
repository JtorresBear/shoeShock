//
//  ViewController.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import UIKit

class DiscoverShoeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var topShoesCollection: UICollectionView!
    @IBOutlet weak var otherShoesCollection: UICollectionView!

    let shoeCollection = CollectionService.collection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topShoesCollection.delegate = self
        topShoesCollection.dataSource = self
        otherShoesCollection.delegate = self
        otherShoesCollection.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topShoesCollection {
            return CollectionService.collection.getTopShoes().count
        } else {
            return CollectionService.collection.getAllShoes().count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == topShoesCollection {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopShoes", for: indexPath) as? TopShoeCell {
                let topShoe = shoeCollection.getTopShoes()[indexPath.row]
                cell.updateViews(shoe: topShoe, row: indexPath.row)
                return cell
            }
        } else if collectionView == otherShoesCollection {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherShoes", for: indexPath) as? OtherShoesCollectionViewCell {
                let otherShoe = shoeCollection.getAllShoes()[indexPath.row]
                cell.updateViews(shoe: otherShoe, row: indexPath.row)
                return cell
            }
        }
        return TopShoeCell()
    }

}

