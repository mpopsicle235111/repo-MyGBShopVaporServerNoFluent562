//
//  ShoppingCartController.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

class ShoppingCartController {
    func getShoppingCart(_ req: Request) throws -> EventLoopFuture<ShoppingCartResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = ShoppingCartResponse(
            amount: 450,
            itemsCount: 2,
            contents: [
                ShoppingCartContents(itemId: 1, itemName: "Golden Seed Sunflower Oil Small", price: 200, quantity: 1),
                ShoppingCartContents(itemId: 2, itemName: "Labas Ritas Butter", price: 250, quantity: 1)
            ]
        )
        
        return req.eventLoop.future(response)
    }
    
    func payForShoppingCart(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: "Order paid, wait for email confirmation.",
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
    
    func addToShoppingCart(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(ShoppingCart.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: "Item added to cart",
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
    
    func deleteFromShoppingCart(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(ShoppingCart.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: "Item removed",
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
}

