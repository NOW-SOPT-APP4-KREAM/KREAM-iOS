//
//  AppTab.swift
//  KREAM
//
//  Created by 박민서 on 5/13/24.
//

import UIKit

///  AppTabBarController의 탭 내용입니다.
enum AppTab: String, CaseIterable {
    case home = "HOME"
    case style = "STYLE"
    case shop = "SHOP"
    case saved = "SAVED"
    case my = "MY"
    
    var image: UIImage {
        switch self {
            
        case .home:
            return .icnHome.withTintColor(.black02, renderingMode: .alwaysTemplate)
        case .style:
            return .icnStyle.withTintColor(.black02, renderingMode: .alwaysTemplate)
        case .shop:
            return .icnShop.withTintColor(.black02, renderingMode: .alwaysTemplate)
        case .saved:
            return .icnSaved.withTintColor(.black02, renderingMode: .alwaysTemplate)
        case .my:
            return .icnMy.withTintColor(.black02, renderingMode: .alwaysTemplate)
        }
    }
}
