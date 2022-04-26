//
//  SignupCompleteController.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/04.
//

import UIKit

class CompleteController: UIViewController {

    
    @IBOutlet weak var nameMessage: UILabel!
    var message : String?
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
        //스토리보드 찾아주기 (다른 파일에 있는 스토리보드임)
        let sb = UIStoryboard.init(name: "Tabbar", bundle: nil)
        guard let tabVC = sb.instantiateViewController(withIdentifier: "TabbarVC") as? UITabBarController else {return}
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(tabVC, animated: false)
    }
    
    private func setName(){
        if let message = message {
            nameMessage.text = "\(message)님, Instagram에"
            nameMessage.sizeToFit()
        }
    }

}
