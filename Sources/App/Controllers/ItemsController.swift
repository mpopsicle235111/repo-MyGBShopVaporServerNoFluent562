//  ItemsController.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

class ItemsController {
    func getCatalogue(_ req: Request) throws -> EventLoopFuture<[CatalogueResponse]> {
        guard let body = try? req.content.decode(Catalogue.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = [CatalogueResponse(pageNumber: 1,
                                          items: [
                                            CatalogueContent(itemId: 1, itemName: "Zumba Dancing Bag", price: 6, shortDescription: "Zumba Plastic Bag", picUrl: "https://proflebedev.ru/images/bag.jpg"),
                                            CatalogueContent(itemId: 2, itemName: "Golden freckles", price: 50, shortDescription: "Golden girly freckles", picUrl: "https://proflebedev.ru/images/freckles.jpg"),
                                            CatalogueContent(itemId: 3, itemName: "Unbreakable Zumba Hoodie", price: 21, shortDescription: "Sleeveless hoodie", picUrl: "https://proflebedev.ru/images/hoodie.jpg")
                                          ])]
        
        
        return req.eventLoop.future(response)
    }
    
    func getItem(_ req: Request) throws -> EventLoopFuture<ItemResponse> {
        guard let body = try? req.content.decode(Item.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        var response = ItemResponse(result: 1, itemId: 999, itemName: "Unknown Item", price: 0, description: "Unknown Something", picUrl: nil)
        
        switch body.itemId {
        case 1: response = ItemResponse(result: 1, itemId: 1, itemName: "Zumba Dancing Bag", price: 6, description: "Cool and inexpensive bag to carry your towel and water bottle", picUrl: "https://proflebedev.ru/images/bag.jpg")
        case 2: response = ItemResponse(result: 1, itemId: 2, itemName: "Golden freckles", price: 50, description: "Lovely freckles for your party", picUrl: "https://proflebedev.ru/images/freckles.jpg")
        case 3: response = ItemResponse(result: 1, itemId: 3, itemName: "Unbreakable Zumba Hoodie", price: 21, description: "Bright tee for your first Zumba par-tee", picUrl: "https://proflebedev.ru/images/hoodie.jpg")
        default: response = ItemResponse(result: 1, itemId: 4, itemName: "Unknown Item", price: 0, description: "Unknown Something", picUrl: nil)
        }
        
        return req.eventLoop.future(response)
    }
}
