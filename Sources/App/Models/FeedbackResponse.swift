//
//  FeedbackResponse.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct FeedbackResponse: Content {
    let userId: Int?
    let text: String?
}


