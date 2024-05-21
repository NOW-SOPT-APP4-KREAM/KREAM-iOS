//
//  ItemDetail.swift
//  KREAM
//
//  Created by 박민서 on 5/21/24.
//

/// Item의 디테일 정보를 표시하기 위한 모델입니다
struct ItemDetail {
    // item internal info
    let itemId: Int
    // top info
    var isPreviouslySeen: Bool // 앱 내에서 변경될 여지가 있는 변수는 var
    let tradeVolume: String? // 처음 생성 시를 제외하고 변경되지 않으면 let
    let imageUrl: String
    let isBookmarked: Bool? // 전달되지 않을 수도 있으면 optional
    // middle info
    let brandName: String?
    let isCheck: Bool
    let englishName: String
    let koreanName: String?
    // tag info
    let isExpress: Bool
    let isCoupon: Bool
    let isFreeShip: Bool
    // bottom info
    let price: String
    let isBuyNowPrice: Bool
    let bookmarkCount: String?
    let heartCount: String?
}
