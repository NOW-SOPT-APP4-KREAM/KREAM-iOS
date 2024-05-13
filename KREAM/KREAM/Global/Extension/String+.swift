//
//  String+.swift
//  KREAM
//
//  Created by 박민서 on 5/13/24.
//

import UIKit

extension String {
    
    /// 일반 문자열을 KREAM의 폰트 가이드에 맞춘 NSMutableAttributedString으로 변환합니다.
    /// - parameter type: 적용할 KREAM 폰트 가이드 타입
    /// - parameter textColor: 적용할 텍스트 색
    /// - Returns: font, size, weight, lineHeight, letterSpacing 설정이 모두 적용된 NSMutableAttributedString
    func toKreamFontString(_ type: AppleSDGothicNeo, textColor: UIColor = .black) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = type.letterSpacing ?? 0
        paragraphStyle.lineHeightMultiple = type.lineHeight ?? 1
        attrString.setAttributes(
            [
                .paragraphStyle : paragraphStyle,
                .font : UIFont(name: type.fontName, size: type.fontSize) ?? .systemFont(ofSize: type.fontSize, weight: type.fontWeight),
                .foregroundColor : textColor
            ],
            range: NSRange(location: 0, length: attrString.length)
        )
        return attrString
    }
}
