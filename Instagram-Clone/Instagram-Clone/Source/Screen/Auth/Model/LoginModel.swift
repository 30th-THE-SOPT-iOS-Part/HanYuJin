//
//  LoginModel.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/05/09.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let name: String
    let email: String
}
