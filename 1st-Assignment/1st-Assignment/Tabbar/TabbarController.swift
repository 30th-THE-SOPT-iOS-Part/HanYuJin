//
//  TabbarController.swift
//  1st-Assignment
//
//  Created by 한유진 on 2022/04/16.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarController()
    }
    func setTabBarController() {
        
        //연결할 스토리보드 인스턴스 생성하기
        guard let HomeTabViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "HomeTabViewController"),
                let SearchViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController"),
              let VideoTabViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "VideoTabViewController"),
              let ShoppingTabViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "ShoppingTabViewController"),
              let ProfileTabViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileTabViewController")
                else {return}
        
        //탭 바 아이템 세팅

        HomeTabViewController.tabBarItem = UITabBarItem(
<<<<<<< HEAD
            title: "home", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_selected"))
        SearchViewController.tabBarItem = UITabBarItem(
            title: "search", image: UIImage(named: "icn_search"), selectedImage:UIImage(named: "icn_search_selected"))
        VideoTabViewController.tabBarItem = UITabBarItem(
            title: "reels", image: UIImage(named: "icn_reels"), selectedImage:UIImage(named: "icn_reels_selected"))
        ShoppingTabViewController.tabBarItem = UITabBarItem(
            title: "shop", image: UIImage(named: "icn_shop"), selectedImage:UIImage(named: "icn_shop_selected"))
        ProfileTabViewController.tabBarItem = UITabBarItem(
            title: "profile", image: UIImage(named: "icn_profile"), selectedImage:UIImage(named: "icn_profile_selected"))
=======
            title: "", image: UIImage(systemName: "icn_home"), selectedImage: UIImage(systemName: "icn_home_selected"))
        SearchViewController.tabBarItem = UITabBarItem(
            title: "", image: UIImage(systemName: "icn_search"), selectedImage:UIImage(systemName: "icn_search_selected"))
        VideoTabViewController.tabBarItem = UITabBarItem(
            title: "", image: UIImage(systemName: "icn_reels"), selectedImage:UIImage(systemName: "icn_reels_selected"))
        ShoppingTabViewController.tabBarItem = UITabBarItem(
            title: "", image: UIImage(systemName: "icn_shop"), selectedImage:UIImage(systemName: "icn_shop_selected"))
        ProfileTabViewController.tabBarItem = UITabBarItem(
            title: "", image: UIImage(systemName: "icn_profile"), selectedImage:UIImage(systemName: "icn_profile_selected"))
>>>>>>> yujindonut
        
        //뷰 컨트롤러 연결하기
        setViewControllers( [ HomeTabViewController, SearchViewController, VideoTabViewController,ShoppingTabViewController,ProfileTabViewController ] , animated: true)
    }
}
