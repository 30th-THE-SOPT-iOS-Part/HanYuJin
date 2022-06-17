//
//  UserService.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/05/09.
//
/*
 서비스 코드
 - request : 요청서를 작성 / 서버에 요청
 - response : 서버에서의 반환값
 */

import Foundation
import Alamofire

class UserService {
    
    static let shared = UserService()
    
    private init() {}
    
    func login(name: String, email: String, password: String, completion: @escaping(NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.loginURL
        
        let header : HTTPHeaders = ["Content-Type" : "application/json"]
        //HTTP Headers
        let body : Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        
        //요청서 //Request 생성
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        //request 시작
        dataRequest.responseData{
            response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    func signup(name: String, email: String, password: String, completion: @escaping(NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.signUpURL
        print(url)
        let header : HTTPHeaders = ["Content-Type" : "application/json"]
        //HTTP Headers
        let body : Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        print(body)
        //요청서 //Request 생성
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        //request 시작
        dataRequest.responseData{
            response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                print("success")
                let networkResult = self.judgeSignupStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300 : return isVaildData(data: data)
        case 400..<500 : return .pathErr
        case 500..<600 : return .serverErr
        default : return .networkFail
        }
    }
    private func judgeSignupStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300 :
            print(statusCode,"입니다")
            return isSignupVaildData(data: data)
        case 400..<500 :
            print(statusCode,"입니다")
            return .pathErr
        case 500..<600 :
            print(statusCode,"입니다")
            return .serverErr
        default :
            print(statusCode,"입니다")
            return .networkFail
        }
    }
    private func isVaildData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
    private func isSignupVaildData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        print("성공은 해서 signupvaliddata에 들어옴")
        guard let decodedData = try? decoder.decode(SignupResponse.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
