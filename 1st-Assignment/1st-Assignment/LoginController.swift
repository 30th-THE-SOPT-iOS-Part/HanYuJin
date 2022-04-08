//
//  ViewController.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        emailTextField.clearButtonMode = .whileEditing
        
        passwordTextField.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
        // Do any additional setup after loading the view.
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        // handle event
//        buttonLogin.backgroundColor = UIColor(red: 55, green: 151, blue: 239, alpha: 1)
        buttonLogin.tintColor = UIColor(red: 55/255, green: 151/255, blue: 239/255, alpha: 1)
//        print("clicked")
    }
//    UINavigationController
//    push이동 : 스택위에 뷰컨을 push하고 화면을 업데이트
    @IBAction func signupClickButton(_ sender: Any) {
        guard let goToSignUpController = self.storyboard?.instantiateViewController(withIdentifier: "SignupMakeNameController") else { return }
        self.navigationController?.pushViewController(goToSignUpController, animated: true)
    }
//    로그인 : present 이동하기
//    modally : 뷰 위에 뷰가 한겹 올라간 구조
    @IBAction func loginClickButton(_ sender: Any) {
        guard let goToCompleteController = self.storyboard?.instantiateViewController(withIdentifier: "CompleteController") as? CompleteController else { return }
//
        goToCompleteController.message = emailTextField.text
        
        self.present(goToCompleteController, animated: true, completion: nil)
    }
}

