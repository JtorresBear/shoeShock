//
//  File.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import Foundation

class Cart {
    static let cart = Cart()
    
    private let shoes = [
        Shoe(brand: "Nike", name: "Space Hippie", price: "$268.00)"),
        Shoe(brand: "Nike", name: "Air Jordan 1", price: "$469.00"),
        Shoe(brand: "Nike", name: "OverCast", price: "$215.00"),
        Shoe(brand: "Nike", name: "Mag BTF", price: "$65,000.00"),
        Shoe(brand: "Nike", name: "Dunk Low ", price: "$400.00"),
        Shoe(brand: "Nike", name: "Dunk Low", price: "$515.00)"),
        Shoe(brand: "Nike", name: "Dunk High", price: "$214.00)"),
        Shoe(brand: "Nike", name: "Air Max 97", price: "$296.00)"),
        Shoe(brand: "Nike", name: "Air More Uptempo", price: "$185.00)"),
        Shoe(brand: "Nike", name: "Space Hippie", price: "$1,484.00)")
    ]
    private let topShoes = [
        Shoe(brand: "Nike", name: "Space Hippie", price: "$268.00)"),
        Shoe(brand: "Nike", name: "Air Jordan 1", price: "$469.00"),
        Shoe(brand: "Nike", name: "OverCast", price: "$215.00"),
        Shoe(brand: "Nike", name: "Mag BTF", price: "$65,000.00"),
        Shoe(brand: "Nike", name: "Dunk Low ", price: "$400.00")
    ]
    
    private var selectedShoes = [Shoe]()
    
}

