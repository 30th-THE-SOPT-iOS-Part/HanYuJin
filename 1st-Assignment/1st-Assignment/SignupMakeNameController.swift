//
//  SignupMakeName.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class SignupMakeNameController: UIViewController {

    @IBOutlet weak var signupName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")  
        // Do any additional setup after loading the view.
//        backButton.isUserInteractionEnabled = true
//        backButton.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(BackButtonClick)))
        
    }
    @IBAction func nextButton(_ sender: Any) {
        guard let goToNextController = self.storyboard?.instantiateViewController(withIdentifier: "SignupMakePasswordController") as? SignupMakePasswordController else { return }
        goToNextController.messageName = signupName.text
        self.navigationController?.pushViewController(goToNextController, animated: true)
    }
//    @objc func BackButtonClick(sender : UITapGestureRecognizer){
//        self.navigationController?.popViewController(animated: true)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
