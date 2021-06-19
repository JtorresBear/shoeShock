//
//  File.swift
//  shoeShock
//
//  Created by Juan Torres on 5/11/21.
//

import Foundation

struct Shoe {
    var brand : String
    var name  : String
    var price : Double
    var shoeDescription: String
    var number: Int
    var selected: Bool
}

extension Shoe: Equatable{
    static func == (lhs: Shoe, rhs: Shoe) -> Bool {
        return lhs.name == rhs.name
    }
}
