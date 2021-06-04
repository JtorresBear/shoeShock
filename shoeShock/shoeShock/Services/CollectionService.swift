//
//  File.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import Foundation

class CollectionService {
    static let collection = CollectionService()
    
    private let shoes = [
//        Shoe(brand: "Nike", name: "Space Hippie", price: "$268.00)", shoeDescription: "This shoe will make you jump Higher and faster", number: 1),
//        Shoe(brand: "Nike", name: "Air Jordan 1", price: "$469.00", shoeDescription: "This shoe will make you run faster than light", number: 2),
//        Shoe(brand: "Nike", name: "OverCast", price: "$215.00", shoeDescription: "This shoe slows down time if you click your heals",number: 3),
//        Shoe(brand: "Nike", name: "Mag BTF", price: "$65,000.00", shoeDescription: "This shoe is way too much money. but worth every penny.",number: 4),
//        Shoe(brand: "Nike", name: "Dunk Low ", price: "$400.00", shoeDescription: "This shoe will never get old and neither will the wearer",number: 5),
        Shoe(brand: "Nike", name: "Dunk Low", price: 515.00, shoeDescription: "This shoe allows you to walk on water. ",number: 6),
        Shoe(brand: "Nike", name: "Dunk High", price: 214.00, shoeDescription: "This shoe let's you walk on air", number: 7),
        Shoe(brand: "Nike", name: "Air Max 97", price: 296.00, shoeDescription: "These shoes kick likc bruce lee", number: 8),
        Shoe(brand: "Nike", name: "Air More Uptempo", price: 185.00, shoeDescription: "This shoe lets you walk on walls. But maybe get the water or air ones", number: 9),
        Shoe(brand: "Nike", name: "Space Hippie", price: 1484.00, shoeDescription: "This shoe can let you time travel. But you can't Travel in reversed",number: 10)
    ]
    private let topShoes = [
        Shoe(brand: "Nike", name: "Space Hippie", price: 268.00, shoeDescription: "This shoe will make you jump Higher and faster", number: 1),
        Shoe(brand: "Nike", name: "Air Jordan 1", price: 469.00, shoeDescription: "This shoe will make you run faster than light", number: 2),
        Shoe(brand: "Nike", name: "OverCast", price: 215.00, shoeDescription: "This shoe slows down time if you click your heals", number: 3),
        Shoe(brand: "Nike", name: "Mag BTF", price: 65000.00, shoeDescription: "This shoe is way too much money. but worth every penny.", number: 4),
        Shoe(brand: "Nike", name: "Dunk Low ", price: 400.00, shoeDescription: "This shoe will never get old and neither will the wearer",number: 5),
        
    ]
    
    struct SelectedShoe {
        
        let shoe: Shoe
        var quantity: Double = 0
        
    }
    
    
    private var selectedShoes = [SelectedShoe]()
    
    func selectShoe(shoe: Shoe, quantity: Double) {
        let newSelection = SelectedShoe(shoe: shoe, quantity: quantity)
        var hasShoe = false
        for selected in selectedShoes {
            if selected.shoe.name == newSelection.shoe.name {
                hasShoe = true
            }
        }
        if !hasShoe {
            selectedShoes.append(newSelection)
        }
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
    
    
    func getTopShoes() -> [Shoe] {
        return topShoes
    }
    
    func getAllShoes() -> [Shoe] {
        return shoes
    }
    
    func getSelectedShoes() -> [SelectedShoe] {
        return selectedShoes
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

