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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")
        textfieldChange()
    }
    private func textfieldChange(){
        passwordTextfield.clearButtonMode = .whileEditing
        passwordTextfield.addTarget(self, action: #selector(handleTextFieldDidChange), for:
                .editingChanged)
    }
    @objc func handleTextFieldDidChange(_ textField: UITextField) {
        nextbtn.tintColor = UIColor(red: 55/255, green: 151/255, blue: 239/255, alpha: 1)
        print("clicked!!")
    }
    
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "CompleteController") as? CompleteController else { return }
        goToNextController.message = messageName
        self.navigationController?.pushViewController(goToNextController, animated: true)
    }

}
