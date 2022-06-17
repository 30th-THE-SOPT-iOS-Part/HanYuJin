//
//  APIConstants.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/05/09.
//
import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    // loginURL = "http://13.124.62.236/auth/signin"
    static let loginURL = baseURL + "/auth/signin"
    
    // signUpURL = "http://13.124.62.236/auth/signup"
    static let signUpURL = baseURL + "/auth/signup"
}
