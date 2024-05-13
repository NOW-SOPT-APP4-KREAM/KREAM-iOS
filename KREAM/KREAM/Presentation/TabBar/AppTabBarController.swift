//
//  AppTabBarController.swift
//  KREAM
//
//  Created by 박민서 on 5/13/24.
//

import UIKit

final class AppTabBarController: UITabBarController {
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpStyle()
    }
    
    // MARK: setUpView
    private func setUpView() {
        let homeViewController = UIViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let styleViewController = UIViewController()
        styleViewController.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "first"), tag: 1)
        styleViewController.tabBarItem.setTitleTextAttributes(AppleSDGothicNeo.Body7(.bold).attributes, for: .normal)
        styleViewController.tabBarItem.image = UIImage(named: "first")?.withRenderingMode(.alwaysOriginal) // 이미지 설정 및 템플릿 모드 비활성화
                
        let shopViewController = UIViewController()
        shopViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        
        let savedViewController = UIViewController()
        savedViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        
        let myViewController = UIViewController()
        myViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 4)
        
        setViewControllers([homeViewController, styleViewController, shopViewController, savedViewController, myViewController], animated: true)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .white
        self.tabBar.backgroundColor = .white
        
        self.tabBar.layer.borderColor = UIColor.gray05.cgColor
        self.tabBar.layer.borderWidth = 1
    }
}
