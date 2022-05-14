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
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNextButton()
        customBackButtonNavigationBar()
        textfieldChange()
    }
    //MARK: - Button
    private func setNextButton(){
        nextButton.backgroundColor = .button_skyblue
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .disabled)
        nextButton.isEnabled = false
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "SignupMakePasswordController") as? SignupMakePasswordController else { return }
        goToNextController.messageName = signupName.text
        self.navigationController?.pushViewController(goToNextController, animated: true)
    }
}
extension SignupMakeNameController {
    
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
}
