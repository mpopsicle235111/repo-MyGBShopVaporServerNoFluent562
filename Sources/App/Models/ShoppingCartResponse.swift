//
//  ShoppingCartResponse.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct ShoppingCartResponse: Content {
    var amount: Int?
    var itemsCount: Int?
    var contents: [ShoppingCartContents]
}

struct ShoppingCartContents: Content {
    var itemId: Int?
    var itemName: String?
    var price: Int?
    var quantity: Int?
}


