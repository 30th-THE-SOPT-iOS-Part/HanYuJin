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
    func removeTextField(_ emailTextField:UITextField, _ passwordTextField:UITextField) {
        [emailTextField,passwordTextField].forEach {
            $0.text?.removeAll()
        }
    }
}

