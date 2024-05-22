//
//  ItemType.swift
//  KREAM
//
//  Created by 박민서 on 5/21/24.
//

import Foundation

/// ItemInfoDetailCollectionViewCell의 Cell 표시 타입 enum입니다.
enum ItemType {
    case full
    case bigMid
    case smallMid
    case compact
    
    /// case 별 cellSize를 리턴합니다
    var cellSize: CGSize {
        switch self {
            
        case .full:
            return .init(width: 168, height: 331)
        case .bigMid:
            return .init(width: 143, height: 264)
        case .smallMid:
            return .init(width: 109, height: 170)
        case .compact:
            return .init(width: 96, height: 140)
        }
    }
    
}
