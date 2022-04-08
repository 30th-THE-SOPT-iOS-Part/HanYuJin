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

        setName()
        // Do any additional setup after loading the view.
    }
    @IBAction func completeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setName(){
        if let message = message {
            nameMessage.text = "\(message)님, Instagram에"
            nameMessage.sizeToFit()
        }
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
