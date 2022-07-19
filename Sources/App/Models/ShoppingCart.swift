//
//  ShoppingCart.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct ShoppingCart: Content {
    var itemId: Int?
    var quantity: Int?
}

