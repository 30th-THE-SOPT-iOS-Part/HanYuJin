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
    @IBOutlet weak var eyeButton: UIButton!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
        setNavigationController()
        textfieldChange()
        setButtonImage()
    }
    private func setNavigationController(){
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    private func setLoginButton(){
        buttonLogin.backgroundColor = UIColor(displayP3Red: 155/255, green: 203/255, blue: 247/255, alpha: 1)
        buttonLogin.setTitle("로그인", for: .normal)
        buttonLogin.setTitleColor(.white, for: .disabled)
        buttonLogin.isEnabled = false
    }
    private func textfieldChange(){
        emailTextField.clearButtonMode = .whileEditing
        passwordTextField.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        if  (emailTextField.hasText && passwordTextField.hasText) {
            buttonLogin.isEnabled = true
        } else{
            buttonLogin.isEnabled = false
        }
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
        
        goToCompleteController.message = emailTextField.text
        
        self.present(goToCompleteController, animated: true, completion: nil)
    }
    @IBAction func clickEyeButton(_ sender: Any) {
        flag = !flag
        if flag == true{
            passwordTextField.isSecureTextEntry = true
        } else{
            passwordTextField.isSecureTextEntry = false
        }
        setButtonImage()
    }
    func setButtonImage(){
        let imgName = flag ? "password-hidden-icon" : "password-shown-icon"
        let image = UIImage(named: "\(imgName).png")!
        eyeButton.setImage(image, for: .normal)
    }
    
}

