//
//  AppleSDGothicNeo.swift
//  KREAM
//
//  Created by 박민서 on 5/13/24.
//

import UIKit

/// KREAM App에서 사용되는 폰트 가이드입니다.
/// AppleSDGothicNeo 폰트체를 사용합니다.
enum AppleSDGothicNeo {
    /// IOS/Head1_ios: Heavy, Bold
    case head1(_ weight: UIFont.Weight)
    /// IOS/Head2_ios: Heavy_-2%
    case head2(_ weight: UIFont.Weight)
    /// IOS/Body1_ios: Bold, Semibold, Regular
    case body1(_ weight: UIFont.Weight)
    /// IOS/Body2_ios: Heavy, Bold, Semibold
    case body2(_ weight: UIFont.Weight)
    /// IOS/Body3_ios: Bold
    case body3(_ weight: UIFont.Weight)
    /// IOS/Body4_ios: Black, Bold, SemiBold, Regular, Regular_150%
    case body4(_ weight: UIFont.Weight, isLh150: Bool)
    /// IOS/Body5_ios: SemiBold, Regular
    case body5(_ weight: UIFont.Weight)
    /// IOS/Body6_ios: Black, Bold, SemiBold, Regular
    case body6(_ weight: UIFont.Weight)
    /// IOS/Body7_ios: Bold, SemiBold, Regular
    case body7(_ weight: UIFont.Weight)
    /// IOS/Body8_ios: SemiBold
    case body8(_ weight: UIFont.Weight)
    /// IOS/Custom
    case custom(size: CGFloat, weight: UIFont.Weight)
    
    /// 폰트의 weight입니다
    var fontWeight: UIFont.Weight {
        switch self {
            
        case    .head1(let weight),
                .head2(let weight),
                .body1(let weight),
                .body2(let weight),
                .body3(let weight),
                .body4(let weight, _),
                .body5(let weight),
                .body6(let weight),
                .body7(let weight),
                .body8(let weight),
                .custom(_, let weight):
            return weight
        }
    }
    
    /// 폰트의 systemName입니다
    var fontName: String {
        switch self.fontWeight {
            
        case .black:
            return "AppleSDGothicNeo-Black"
        case .heavy:
            return "AppleSDGothicNeo-Heavy"
        case .bold:
            return "AppleSDGothicNeo-Bold"
        case .semibold:
            return "AppleSDGothicNeo-Semibold"
        case .regular:
            return "AppleSDGothicNeo-Regular"
        case .medium:
            return "AppleSDGothicNeo-Medium"
        case .light:
            return "AppleSDGothicNeo-Light"
        case .thin:
            return "AppleSDGothicNeo-Thin"
        case .ultraLight:
            return "AppleSDGothicNeo-UltraLight"
        default:
            return "AppleSDGothicNeo-Regular"
        }
    }
    
    /// 폰트의 size입니다
    var fontSize: CGFloat {
        switch self {
            
        case .head1:
            return 19
        case .head2:
            return 17
        case .body1:
            return 16
        case .body2:
            return 15
        case .body3:
            return 14
        case .body4:
            return 13
        case .body5:
            return 12
        case .body6:
            return 11
        case .body7:
            return 10
        case .body8:
            return 9
        case let .custom(size, _):
            return size
        }
    }
    
    /// 폰트의 lineHeight입니다.
    var lineHeight: CGFloat? {
        switch self {
        case let .body4(_, isLh150):
            return isLh150 ? 1.5 : nil
        default:
            return nil
        }
    }
    
    /// 폰트의 letterSpacing입니다.
    var letterSpacing: CGFloat? {
        switch self {
        
        case .head2:
            return -2
        case .body2(let weight):
            return weight == .heavy ? 7 : nil
        case .body7(let weight):
            return weight == .bold ? 3 : nil
        default:
            return nil
        }
    }
    
    var attributes: [NSAttributedString.Key : Any] {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = self.letterSpacing ?? 0
        paragraphStyle.lineHeightMultiple = self.lineHeight ?? 1
        
        let attributes: [NSAttributedString.Key : Any] = [
            .paragraphStyle : paragraphStyle,
            .font : UIFont(name: self.fontName, size: self.fontSize) ?? .systemFont(ofSize: self.fontSize, weight: self.fontWeight)
        ]
        return attributes
    }
}
