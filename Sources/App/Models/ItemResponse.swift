//
//  ItemResponse.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct ItemResponse: Content {
    let result: Int?
    let itemId: Int?
    let itemName: String?
    let price: Int?
    let description: String?
    let picUrl: String?
}


