//
//  CartVC.swift
//  shoeShock
//
//  Created by Juan Torres on 5/24/21.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTable: UITableView!
    var selectedShoes = CollectionService.collection.getSelectedShoes()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.delegate = self
        cartTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(CollectionService.collection.getSelectedShoes().count)
        return CollectionService.collection.getSelectedShoes().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = cartTable.dequeueReusableCell(withIdentifier: "SelectedShoe", for: indexPath) as? CartCell {
            cell.updateCell(shoe: selectedShoes[indexPath.row].shoe, quantity: selectedShoes[indexPath.row].quantity)
            print("is doing something")
            return cell
        }
        print("is doing nothing")
        return CartCell()
    }

}
