//
//  User.swift
//
//
//  Created by Anton Lebedev on 18.07.2022.
//

import Vapor

struct User: Content {
    let userId: Int?
    let userLogin: String?
    let password: String?
    let email: String?
    let gender: String?
    let creditCardNumber: String?
    let tagLine: String?
    let userName: String?
    let userLastName: String?
}
