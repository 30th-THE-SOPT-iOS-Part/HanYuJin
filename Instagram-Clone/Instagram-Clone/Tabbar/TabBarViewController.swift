//
//  TabBarViewController.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/18.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setTabBarColor()
        
    }
    private func setTabBarColor() {
        tabBar.unselectedItemTintColor = .white
    }
    private func setDelegate() {
        self.delegate = self
    }
}
extension TabBarViewController : UITabBarControllerDelegate {
    //탭버튼이 클릭될때 호출됨
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex == 2 {
            tabBar.backgroundColor = .black
            tabBar.barTintColor = .white
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        } else {
            tabBar.backgroundColor = .white
            tabBar.barTintColor = .black
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
    }
}
