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
    @IBOutlet weak var buttonSignUp: UIButton!
    var eyeButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
        setSignUpButton()
        setNavigationControllerBar()
        textfieldChange()
        setPasswordShownButtonImage()
    }
    private func setPasswordShownButtonImage(){
        eyeButton = UIButton.init(primaryAction: UIAction(handler: { [self]_ in
            passwordTextField.isSecureTextEntry.toggle()
            eyeButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        eyeButton.setImage(UIImage(named: "password-hidden-icon"), for: .normal)
        eyeButton.setImage(UIImage(named: "password-shown-icon"), for: .selected)
        eyeButton.configuration = buttonConfiguration
        
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
    }
    override func viewWillAppear(_ animated: Bool) {
        removeTextField()
    }
    private func removeTextField() {
        [emailTextField,passwordTextField].forEach {
            $0.text?.removeAll()
        }
    }
    private func setSignUpButton(){
        buttonSignUp.setTitle("가입하기", for: .normal)
    }
    
    private func setNavigationControllerBar(){
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    private func setLoginButton(){
        buttonLogin.backgroundColor = .button_skyblue
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
        
        if let name = emailTextField.text, let password = passwordTextField.text {
            login(name: name, email: name, password: password)
        }
        
//        guard let goToCompleteController = self.storyboard?.instantiateViewController(withIdentifier: "CompleteController") as? CompleteController else { return }
//
//        goToCompleteController.name = emailTextField.text
//        goToCompleteController.modalPresentationStyle = .fullScreen
//        self.present(goToCompleteController, animated: true, completion: nil)
    }
}

extension LoginController {
    func login(name: String, email : String, password : String){
        
        UserService.shared.login(name: name, email: email, password: password) {
            response in
            switch response {
            case .success(let data):
                print(response)
                guard let data = data as? LoginResponse else { return }
                print(data)
                self.alertLogin(message: "로그인 성공")
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
    func alertLoginFail(message:String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){
            action 
        }
    }
    func alertLogin(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){
            action in
            let sb = UIStoryboard.init(name: "Tabbar", bundle: nil)
            guard let tabVC = sb.instantiateViewController(withIdentifier: "TabbarVC") as? UITabBarController else {return}
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(tabVC, animated: false)
        }
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
