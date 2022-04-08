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

        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
        textfieldChange()
    }
    private func textfieldChange(){
        signupName.clearButtonMode = .whileEditing
        signupName.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        nextButton.tintColor = UIColor(red: 55/255, green: 151/255, blue: 239/255, alpha: 1)
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "SignupMakePasswordController") as? SignupMakePasswordController else { return }
        goToNextController.messageName = signupName.text
        self.navigationController?.pushViewController(goToNextController, animated: true)
    }
}
