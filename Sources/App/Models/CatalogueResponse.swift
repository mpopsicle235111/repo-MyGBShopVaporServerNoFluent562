//
//  CatalogueResponse.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct CatalogueResponse: Content {
    let pageNumber: Int
    let items: [CatalogueContent]
}

struct CatalogueContent: Content {
    let itemId: Int?
    let itemName: String?
    let price: Int?
    let shortDescription: String?
    let picUrl: String?
}
