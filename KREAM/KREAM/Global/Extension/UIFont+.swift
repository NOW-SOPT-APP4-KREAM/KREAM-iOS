//
//  UIFont+.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit

extension UIFont {
    /// Kream에서 사용하는 폰트를 반환합니다.
    /// - parameter type: 적용할 KREAM 폰트 가이드 타입
    /// - Returns :AppleSDGothicNeo 폰트
    /// 유의사항: 해당 폰트 적용시 줄간격, 자간의 설정은 적용되지 않습니다!
    static func kreamFont(_ type: AppleSDGothicNeo) -> UIFont {
        return UIFont(name: type.fontName, size: type.fontSize) ??
            .systemFont(ofSize: type.fontSize, weight: type.fontWeight)
    }
}
