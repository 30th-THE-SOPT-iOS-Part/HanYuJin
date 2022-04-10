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

        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icn_back_24")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icn_back_24")  
        setName()
    }
    @IBAction func completeButton(_ sender: Any) {
        
//popToRootViewController(animated:) : rootViewController 를 제외한 모든 view controller 를 pop 한다.
//popToViewController(_:animated:) : 특정 viewController 가 navigation stack 의 맨 위에 올때까지 pop 한다.
//popViewController(animated:) : navigation stack 에서 view controller 를 pop 한다.
        
//presentedViewController : 자신이 호출한 ViewController
//presentingViewController : 자신을 호출한 ViewController
//소연언니가 힌트로 알려준 코드 --> 실행안됨...ㅠ0ㅠ
//        guard let loginVC = presentingViewController as? UINavigationController else { return }
//        self.dismiss(animated: true) {
//            loginVC.popToRootViewController(animated: true)
//        }
        
        self.dismiss(animated: true){
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    private func setName(){
        if let message = message {
            nameMessage.text = "\(message)님, Instagram에"
            nameMessage.sizeToFit()
        }
    }

}
