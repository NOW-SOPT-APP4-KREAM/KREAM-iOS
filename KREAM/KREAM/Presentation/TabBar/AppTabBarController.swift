//
//  AppTabBarController.swift
//  KREAM
//
//  Created by 박민서 on 5/13/24.
//

import UIKit

/// App의 하단 TabBarController 입니다.
final class AppTabBarController: UITabBarController {
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpStyle()
    }
    
    // MARK: setUpView
    private func setUpView() {
    
        let homeViewController = ReleaseInfoPageViewController()
        let styleViewController = UIViewController()
        let shopViewController = UIViewController()
        let savedViewController = UIViewController()
        let myViewController = UIViewController()
        
        let viewControllerList = [
            homeViewController,
            styleViewController,
            shopViewController,
            savedViewController,
            myViewController
        ]
        
        viewControllerList.enumerated().forEach { index, viewController in
            let tab = AppTab.allCases[index]
            viewController.tabBarItem = UITabBarItem(title: tab.rawValue, image: tab.image, tag: index)
            viewController.tabBarItem.setTitleTextAttributes(AppleSDGothicNeo.body7(.bold).attributes, for: .normal)
        }
        
        self.setViewControllers(viewControllerList, animated: true)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        self.tabBar.tintColor = .black02
        self.tabBar.barTintColor = .white
        self.tabBar.backgroundColor = .white
        
        self.tabBar.layer.borderColor = UIColor.gray05.cgColor
        self.tabBar.layer.borderWidth = 1
    }
}
