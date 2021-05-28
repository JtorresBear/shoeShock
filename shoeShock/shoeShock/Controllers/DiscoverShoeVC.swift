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
    
    override func viewWillAppear(_ animated: Bool) {
        topShoesCollection.reloadData()
        otherShoesCollection.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCartButton()
        createDelegatesAndDataSources()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == topShoesCollection){
            let shoe = shoeCollection.getTopShoes()[indexPath.row]
            performSegue(withIdentifier: "ShoeDetail", sender: shoe)
        }
        if(collectionView == otherShoesCollection) {
            let shoe = shoeCollection.getAllShoes()[indexPath.row]
            performSegue(withIdentifier: "ShoeDetail", sender: shoe)
        }
    }
    
    
    func createCartButton(){
        let barButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(cartButtonTapped))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func cartButtonTapped(){
        performSegue(withIdentifier: "showCart", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShoeDetail") {
            let shoeDetailVC = segue.destination as! ShoeDetailVC
            shoeDetailVC.shoe = sender as! Shoe
        }
    }
    

    @IBAction func unwind(_ sender: UIStoryboardSegue){}

    
    func createDelegatesAndDataSources(){
        topShoesCollection.delegate = self
        topShoesCollection.dataSource = self
        otherShoesCollection.delegate = self
        otherShoesCollection.dataSource = self
    }

}

