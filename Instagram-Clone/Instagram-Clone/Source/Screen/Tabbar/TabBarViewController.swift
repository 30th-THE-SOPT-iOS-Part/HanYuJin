//
//  TabBarViewController.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/18.
//

import UIKit

class TabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setTabBarColor()
    }
    private func setTabBarColor() {
        //item이 선택되기전에, title색상 검정색으로
        tabBar.unselectedItemTintColor = .black
    }
    private func setDelegate() {
        self.delegate = self
    }
}
extension TabBarViewController : UITabBarControllerDelegate {
    //탭버튼이 클릭될때 호출됨
    func tabBarController(_ tabBarController: UITabBarController, didSelect: UIViewController) {
        if selectedIndex == 2 {
            //다크모드 설정 -> image asset 처리 - backgroundcolor : system background - image tint : label 설정해줘야함
            self.overrideUserInterfaceStyle = .dark
            tabBar.unselectedItemTintColor = .white
        } else {
            self.overrideUserInterfaceStyle = .light
            tabBar.unselectedItemTintColor = .black
        }
    }
}

