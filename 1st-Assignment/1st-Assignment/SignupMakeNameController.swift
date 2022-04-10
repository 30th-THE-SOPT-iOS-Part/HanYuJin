//
//  SignupMakeName.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class SignupMakeNameController: UIViewController {

    @IBOutlet weak var signupName: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginButton()
        setNavigationController()
        textfieldChange()
    }
    private func setLoginButton(){
        nextButton.backgroundColor = UIColor(displayP3Red: 155/255, green: 203/255, blue: 247/255, alpha: 1)
        nextButton.setTitle("로그인", for: .normal)
        nextButton.setTitleColor(.white, for: .disabled)
        nextButton.isEnabled = false
    }
    private func setNavigationController(){
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
    }
    private func textfieldChange(){
        signupName.clearButtonMode = .whileEditing
        signupName.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        if  signupName.hasText {
            nextButton.isEnabled = true
        } else{
            nextButton.isEnabled = false
        }
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "SignupMakePasswordController") as? SignupMakePasswordController else { return }
        goToNextController.messageName = signupName.text
        self.navigationController?.pushViewController(goToNextController, animated: true)
    }
}
