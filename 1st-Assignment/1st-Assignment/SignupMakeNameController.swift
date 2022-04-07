//
//  SignupMakeName.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class SignupMakeNameController: UIViewController {

    @IBOutlet weak var signupName: UITextField!
    
    @IBOutlet weak var backButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(BackButtonClick)))
        
    }
    @objc func BackButtonClick(sender : UITapGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
