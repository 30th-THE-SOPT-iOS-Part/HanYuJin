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
    @IBOutlet weak var eyeButton: UIButton!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationController()
        textfieldChange()
        setButtonImage()
        setLoginButton()
    }
    private func setLoginButton(){
        nextbtn.backgroundColor = UIColor(displayP3Red: 155/255, green: 203/255, blue: 247/255, alpha: 1)
        nextbtn.setTitle("로그인", for: .normal)
        nextbtn.setTitleColor(.white, for: .disabled)
        nextbtn.isEnabled = false
    }
    private func setNavigationController(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        if  passwordTextfield.hasText {
            nextbtn.isEnabled = true
        } else{
            nextbtn.isEnabled = false
        }
    }
    private func textfieldChange(){
        passwordTextfield.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "CompleteController") as? CompleteController else { return }
        goToNextController.message = messageName
        self.navigationController?.pushViewController(goToNextController, animated: true)
    }
    @IBAction func clickEyeButton(_ sender: Any) {
        flag = !flag
        if flag == true{
            passwordTextfield.isSecureTextEntry = true
        } else{
            passwordTextfield.isSecureTextEntry = false
        }
        setButtonImage()
    }
    func setButtonImage(){
        let imgName = flag ? "password-hidden-icon" : "password-shown-icon"
        let image = UIImage(named: "\(imgName).png")!
        eyeButton.setImage(image, for: .normal)
    }
    

}
