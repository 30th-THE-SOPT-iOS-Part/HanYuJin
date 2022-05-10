//
//  SignupCompleteController.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class CompleteController: UIViewController {

    
    @IBOutlet weak var nameMessage: UILabel!
    var name : String?
    var password :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackButtonNavigationBar()
        setName()
    }
    @IBAction func loginWithDifferentIDButton(_ sender: Any) {
        self.dismiss(animated: true){
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    @IBAction func completeButton(_ sender: Any) {
//        let sb = UIStoryboard.init(name: "Tabbar", bundle: nil)
//        guard let tabVC = sb.instantiateViewController(withIdentifier: "TabbarVC") as? UITabBarController else {return}
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(tabVC, animated: false)
        if let name = name, let password = password {
            signup(email: name, name: name, password: password)
        }
    }
    
    private func setName(){
        if let name = name {
            nameMessage.text = "\(name)님, Instagram에"
            nameMessage.sizeToFit()
        }
    }

}
