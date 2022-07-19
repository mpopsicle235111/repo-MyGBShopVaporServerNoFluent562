//
//  UserController.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

class UserController {
    
    let successResponse = DefaultResponse(
        result: 1,
        successMessage: "Request proceeded",
        errorMessage: nil
    )
    
    let errorIncompleteDataResponse = DefaultResponse(
        result: -2,
        successMessage: nil,
        errorMessage: "Please, check: we're missing either your login, or password, or email, or name, or family name"
    )
    
    let errorWrongCredentials = DefaultResponse(
        result: -3,
        successMessage: nil,
        errorMessage: "Wrong password or wrong login, or both..."
    )
    
    let errorInvalidEmail = DefaultResponse(
        result: -4,
        successMessage: nil,
        errorMessage: "Wrong email"
    )
    
    func register(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        guard body.userLogin != nil, body.password != nil, body.userName != nil, body.userLastName != nil, body.email != nil else {
            return req.eventLoop.future(errorIncompleteDataResponse)
        }
        
        return req.eventLoop.future(successResponse)
    }
    
    func changeUserData(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        guard body.userId != nil, body.userLogin != nil, body.password != nil, body.userName != nil, body.userLastName != nil, body.email != nil else {
            return req.eventLoop.future(errorIncompleteDataResponse)
        }
        
        return req.eventLoop.future(successResponse)
    }
    
    func login(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        
        if let userLogin = body.userLogin, let userPassword = body.password {
            if userLogin != "Jack007" || userPassword != "sourCream2!" {
                return req.eventLoop.future(errorWrongCredentials)
            } else {
                return req.eventLoop.future(successResponse)
            }
        } else {
            return req.eventLoop.future(errorIncompleteDataResponse)
        }
    }
    
    func logout(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let _ = try? req.content.decode(User.self) else { throw Abort(.badRequest) }
        return req.eventLoop.future(successResponse)
    }
}

