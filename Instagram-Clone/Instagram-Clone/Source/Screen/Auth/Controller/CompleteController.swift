//
//  SignupCompleteController.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class CompleteController: UIViewController {
    
    
    @IBOutlet weak var nameMessage: UILabel!
    var name : String?
    var password :String?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButtonNavigationBar()
        setName()
    }
    
    //MARK: - Button @IBAction
    @IBAction func loginWithDifferentIDButton(_ sender: Any) {
        self.dismiss(animated: true){
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    @IBAction func completeButton(_ sender: Any) {
        if let name = name, let password = password {
            print(name, password)
            signup(name: name, email: name, password: password)
        }
    }
    
    //MARK: - UI
    private func setName(){
        if let name = name {
            nameMessage.text = "\(name)님, Instagram에 오신 것을 환영합니다." 
            nameMessage.sizeToFit()
        }
    }
}
extension CompleteController {
    
    func signup(name: String, email : String, password : String){

        UserService.shared.signup(name: name, email: email, password: password) {
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
