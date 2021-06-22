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
        title = "buy our shoes"
        cartTable.delegate = self
        cartTable.dataSource = self
        shoeTotalPrice()
        shoeTotalCount()
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
    
    func shoeTotalCount(){
        totalShoes.text = "Q: \(CollectionService.instance.getTotalCount())"
    }
    
    func printitsworking(){
        print("it's working")
    }

    @IBAction func BuyButtonSelected(_ sender: UIButton) {
        guard let totalPrice = totalPrice.text else {return}
        
        let alert = UIAlertController(title: "CONGRATS", message: "You now own these shoes for a price of \(totalPrice)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            //DO CHANGES HERE
            CollectionService.instance.removeAllShoes()
            self.cartTable.reloadData()
            self.totalPrice.text = "$0.00"
            self.totalShoes.text = "Q: 0"
            CollectionService.instance.deselectAllShoes()
        }))
        present(alert, animated: true)
    }
}
