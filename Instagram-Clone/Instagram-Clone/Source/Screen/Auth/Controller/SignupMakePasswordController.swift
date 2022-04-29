//
//  SignupMakePassword.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class SignupMakePasswordController: UIViewController {

    var messageName : String?
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var nextbtn: UIButton!
//    @IBOutlet weak var eyeButton: UIButton!
    var eyeButton = UIButton(type: .custom)
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButtonNavigationBar()
        textfieldChange()
        setPasswordShownButtonImage()
        setLoginButton()
    }
    private func setLoginButton(){
        nextbtn.backgroundColor = .button_skyblue
        nextbtn.setTitle("로그인", for: .normal)
        nextbtn.setTitleColor(.white, for: .disabled)
        nextbtn.isEnabled = false
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        if passwordTextfield.hasText {
            nextbtn.isEnabled = true
        } else{
            nextbtn.isEnabled = false
        }
    }
    private func textfieldChange(){
        passwordTextfield.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
    }
    private func setPasswordShownButtonImage(){
        eyeButton = UIButton.init(primaryAction: UIAction(handler: { [self]_ in
            passwordTextfield.isSecureTextEntry.toggle()
            eyeButton.isSelected.toggle()
        }))
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseBackgroundColor = .clear
        
        eyeButton.setImage(UIImage(named: "password-hidden-icon"), for: .normal)
        eyeButton.setImage(UIImage(named: "password-shown-icon"), for: .selected)
        eyeButton.configuration = buttonConfiguration
        
        passwordTextfield.rightView = eyeButton
        passwordTextfield.rightViewMode = .always
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "CompleteController") as? CompleteController else { return }
        
        goToNextController.message = messageName
        self.navigationController?.present(goToNextController, animated: true){
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
}
