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
    case Head1(_ weight: UIFont.Weight)
    /// IOS/Head2_ios: Heavy_-2%
    case Head2(_ weight: UIFont.Weight)
    /// IOS/Body1_ios: Bold, Semibold, Regular
    case Body1(_ weight: UIFont.Weight)
    /// IOS/Body2_ios: Heavy, Bold, Semibold
    case Body2(_ weight: UIFont.Weight)
    /// IOS/Body3_ios: Bold
    case Body3(_ weight: UIFont.Weight)
    /// IOS/Body4_ios: Black, Bold, SemiBold, Regular, Regular_150%
    case Body4(_ weight: UIFont.Weight, isLh150: Bool)
    /// IOS/Body5_ios: SemiBold, Regular
    case Body5(_ weight: UIFont.Weight)
    /// IOS/Body6_ios: Black, Bold, SemiBold, Regular
    case Body6(_ weight: UIFont.Weight)
    /// IOS/Body7_ios: Bold, SemiBold, Regular
    case Body7(_ weight: UIFont.Weight)
    /// IOS/Body8_ios: SemiBold
    case Body8(_ weight: UIFont.Weight)
    /// IOS/Custom
    case Custom(size: CGFloat, weight: UIFont.Weight)
    
    /// 폰트의 weight입니다
    var fontWeight: UIFont.Weight {
        switch self {
            
        case    .Head1(let weight),
                .Head2(let weight),
                .Body1(let weight),
                .Body2(let weight),
                .Body3(let weight),
                .Body4(let weight, _),
                .Body5(let weight),
                .Body6(let weight),
                .Body7(let weight),
                .Body8(let weight),
                .Custom(_, let weight):
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
            
        case .Head1:
            return 19
        case .Head2:
            return 17
        case .Body1:
            return 16
        case .Body2:
            return 15
        case .Body3:
            return 14
        case .Body4:
            return 13
        case .Body5:
            return 12
        case .Body6:
            return 11
        case .Body7:
            return 10
        case .Body8:
            return 9
        case let .Custom(size, _):
            return size
        }
    }
    
    /// 폰트의 lineHeight입니다.
    var lineHeight: CGFloat? {
        switch self {
        case let .Body4(_, isLh150):
            return isLh150 ? 1.5 : nil
        default:
            return nil
        }
    }
    
    /// 폰트의 letterSpacing입니다.
    var letterSpacing: CGFloat? {
        switch self {
        
        case .Head2:
            return -2
        case .Body2(let weight):
            return weight == .heavy ? 7 : nil
        case .Body7(let weight):
            return weight == .bold ? 3 : nil
        default:
            return nil
        }
    }
}
