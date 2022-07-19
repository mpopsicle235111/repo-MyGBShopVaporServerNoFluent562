//
//  Feedback.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct Feedback: Content {
    var itemId: Int?
    var userId: Int?
    var text: String?
    var commentId: Int?
}


