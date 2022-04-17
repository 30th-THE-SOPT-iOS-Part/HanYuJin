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
    //    @IBOutlet weak var eyeButton: UIButton!
    var eyeButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
        setNavigationController()
        textfieldChange()
        self.setPasswordShownButtonImage()
    }
    override func viewWillAppear(_ animated: Bool) {
        removeTextField()
    }
    //view가 사라질때, textfield 글자 없어지게
    private func removeTextField() {
        [emailTextField,passwordTextField].forEach {
            $0.text?.removeAll()
        }
    }
    private func setPasswordShownButtonImage(){
        eyeButton = UIButton.init(primaryAction: UIAction(handler: { [self]_ in
            passwordTextField.isSecureTextEntry.toggle()
            self.eyeButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        eyeButton.setImage(UIImage(named: "PasswordHiddenIcon"), for: .normal)
        self.eyeButton.setImage(UIImage(named: "PasswordShownIcon"), for: .selected)
        self.eyeButton.configuration = buttonConfiguration
        
        self.passwordTextField.rightView = eyeButton
        self.passwordTextField.rightViewMode = .always
    }
    //    private func eyeButtonClick(){
    //        eyebutton.setImage(passwordTextField.isSecureTextEntry ? UIImage(named: "password-shown-icon") : UIImage(named: "password-hidden-icon"), for: .normal)
    //    }
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
        //        만약에 둘다 addAction이 필요하면, [emailTextField,passwordTextField].forEach {  $0.addAction(UIAction(handler:self.textHandler), for:.editingChanged      }이런 방식으로도 바꿀수 있음
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        if  (emailTextField.hasText && passwordTextField.hasText) {
            buttonLogin.isEnabled = true
        } else{
            buttonLogin.isEnabled = false
        }
        //        self.buttonLogin.isEnabled = self.emailTextField.hasText && self.passwordTextField.hasText
        
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
        eyeButton.setImage(passwordTextField.isSecureTextEntry ? UIImage(named: "password-shown-icon") : UIImage(named: "password-hidden-icon"), for: .normal)
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
}

