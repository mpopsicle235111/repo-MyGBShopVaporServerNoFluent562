//
//  FeedbackController.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

class FeedbackController {
    func getFeedback(_ req: Request) throws -> EventLoopFuture<[FeedbackResponse]> {
        guard let body = try? req.content.decode(Item.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = [
            FeedbackResponse(userId: 1, text: "Very cool item"),
            FeedbackResponse(userId: 2, text: "Also a very cool item for everyday use"),
        ]
        
        return req.eventLoop.future(response)
    }
    
    func addFeedback(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(Feedback.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: "Feedback received!",
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
    
    func removeFeedback(_ req: Request) throws -> EventLoopFuture<DefaultResponse> {
        guard let body = try? req.content.decode(Feedback.self) else { throw Abort(.badRequest) }
        
        print(body)
        
        let response = DefaultResponse(
            result: 1,
            successMessage: nil,
            errorMessage: nil
        )
        
        return req.eventLoop.future(response)
    }
}

