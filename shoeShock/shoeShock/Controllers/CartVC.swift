//
//  CartVC.swift
//  shoeShock
//
//  Created by Juan Torres on 5/24/21.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var totalShoes: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    
    var selectedShoes = CollectionService.instance.getSelectedShoes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.delegate = self
        cartTable.dataSource = self
        shoeTotalPrice()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(CollectionService.instance.getSelectedShoes().count)
        return CollectionService.instance.getSelectedShoes().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = cartTable.dequeueReusableCell(withIdentifier: "SelectedShoe", for: indexPath) as? CartCell {
            cell.cartVC = self 
            cell.selectedShoe = selectedShoes[indexPath.row].shoe
            cell.updateCell(shoe: selectedShoes[indexPath.row].shoe, quantity: selectedShoes[indexPath.row].quantity)
            print("is doing something")
            return cell
        }
        print("is doing nothing")
        return CartCell()
    }
    
    func shoeTotalPrice(){
        totalPrice.text = "$\(CollectionService.instance.getTotalPrice())0"
    }
    
    func printitsworking(){
        print("it's working")
    }

}
