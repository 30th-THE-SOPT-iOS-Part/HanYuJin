//
//  SignupModel.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/05/09.
//

import Foundation

struct SignupResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: SignupData?
}

struct SignupData: Codable {
    let id: String
}
