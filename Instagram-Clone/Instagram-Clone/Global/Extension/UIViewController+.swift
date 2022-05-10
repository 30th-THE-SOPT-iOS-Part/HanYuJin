//
//  UIViewController+.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/22.
//

import UIKit

extension UIViewController {
    
    func customBackButtonNavigationBar(){
        let backButtonIcon = UIImage(named:"icn_back")
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = backButtonIcon
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonIcon
    }
    func login(name: String, email : String, password : String){
        
        UserService.shared.login(name: name, email: email, password: password) {
            response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
                print(data)
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    func signup(email : String, name:String, password: String){
        UserService.shared.signup(name: name, email: email, password: password){
            response in
            switch response {
            case .success(let data):
                guard let data = data as? SignupResponse else { return }
                print(data)
                self.alertSignup(message: "회원가입 성공")
            case .requestErr(let err):
                print(err)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    func alertSignup(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){
            action in
            self.dismiss(animated: true){
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}

