//
//  DefaultResponse.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct DefaultResponse: Content {
    var result: Int
    var successMessage: String?
    var errorMessage: String?
}

