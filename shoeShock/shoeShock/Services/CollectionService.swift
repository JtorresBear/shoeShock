//
//  File.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import Foundation

class CollectionService {
    static let instance = CollectionService()
    
    private var shoes = [
        Shoe(brand: "Nike", name: "Space Hippie", price: 268.00, shoeDescription: "This shoe will make you jump Higher and faster", number: 1, selected: false),
        Shoe(brand: "Nike", name: "Air Jordan 1", price: 469.00, shoeDescription: "This shoe will make you run faster than light", number: 2, selected: false),
        Shoe(brand: "Nike", name: "OverCast", price: 215.00, shoeDescription: "This shoe slows down time if you click your heals",number: 3, selected: false),
        Shoe(brand: "Nike", name: "Mag BTF", price: 65000.00, shoeDescription: "This shoe is way too much money. but worth every penny.",number: 4, selected: false),
        Shoe(brand: "Nike", name: "Dunk Low ", price: 400.00, shoeDescription: "This shoe will never get old and neither will the wearer",number: 5, selected: false),
        Shoe(brand: "Nike", name: "Dunk Low", price: 515.00, shoeDescription: "This shoe allows you to walk on water. ",number: 6, selected: false),
        Shoe(brand: "Nike", name: "Dunk High", price: 214.00, shoeDescription: "This shoe let's you walk on air", number: 7, selected: false),
        Shoe(brand: "Nike", name: "Air Max 97", price: 296.00, shoeDescription: "These shoes kick likc bruce lee", number: 8, selected: false),
        Shoe(brand: "Nike", name: "Air More Uptempo", price: 185.00, shoeDescription: "This shoe lets you walk on walls. But maybe get the water or air ones", number: 9, selected: false),
        Shoe(brand: "Nike", name: "Space Hippie", price: 1484.00, shoeDescription: "This shoe can let you time travel. But you can't Travel in reversed",number: 10, selected: false)
    ]
    
    
    struct SelectedShoe {
        let shoe: Shoe
        var quantity: Double = 0
    }
    
    
    private var selectedShoes = [SelectedShoe]()
    
    func changeSelectedStatus(status: Bool, shoeSelected: Shoe){
        var count = 0
        for shoe in shoes {
            if shoe == shoeSelected {
                shoes[count].selected = status
            }
            count += 1
        }
    }
    func selectShoe(shoe: Shoe, quantity: Double) {
        let newSelection = SelectedShoe(shoe: shoe, quantity: quantity)
        if !hasSelectedShoe(shoe: shoe) {
            selectedShoes.append(newSelection)
        }
    }
    
    func selectShoeFromDetail(shoe: Shoe, quantity: Double){
        if hasSelectedShoe(shoe: shoe) {
            removeSelectedShoe(shoe: shoe)
        }
        selectShoe(shoe: shoe, quantity: quantity)
    }
    
    func removeSelectedShoe(shoe: Shoe) {
        var index = 0
        while (index < selectedShoes.count) {
            if(selectedShoes[index].shoe.name == shoe.name){
                selectedShoes.remove(at: index)
            }
            index += 1
        }
    }
    
    func removeSelectedShoe(index: Int) {
        selectedShoes.remove(at: index)
    }
    
    func getAllShoes() -> [Shoe] {
        return shoes
    }
    
    func getSelectedShoes() -> [SelectedShoe] {
        return selectedShoes
    }
    
    func hasSelectedShoe(shoe: Shoe) -> Bool {
        var doesHaveShoe = false
        var index = 0
        while (index < selectedShoes.count) {
            if(selectedShoes[index].shoe.name == shoe.name){
                doesHaveShoe = true
            }
            index += 1
        }
        return doesHaveShoe
    }
    
    func getTotalPrice()-> Double{
        var totalPrice = 0.0
        for shoe in selectedShoes {
            totalPrice += (shoe.shoe.price * shoe.quantity)
        }
        
        return totalPrice
    }
    
    func changeQuantity(of index: Int, number: Double){
        selectedShoes[index].quantity = number
        print("\(selectedShoes[index].quantity)")
        
        if number == 0 {
            removeSelectedShoe(index: index)
        }
    }
    
}

