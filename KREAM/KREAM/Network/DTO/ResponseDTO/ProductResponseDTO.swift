//
//  ProductResponseDTO.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - ProductResponseDTO
struct ProductResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: ProductDataClass
}

// MARK: - ProductDataClass
struct ProductDataClass: Decodable {
    let searchFindProductResponses: [SearchFindProductResponse]
    let relateRecommendProductResponses: [RelateRecommendProductResponse]
}

// MARK: - RelateRecommendProductResponse
struct RelateRecommendProductResponse: Decodable {
    let thumbnailURL, engTitle, price: String
    let isFast: Bool
    let scrapCount, styleCount: String
    let isFreeDevliver, isSave, isCoupon: Bool

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case engTitle, price, isFast, scrapCount, styleCount, isFreeDevliver, isSave, isCoupon
    }
}

extension RelateRecommendProductResponse {
//    func toItemDetail() -> ItemDetail {
//        return .init(
//            itemId: 0,
//            isPreviouslySeen: false,
//            tradeVolume: <#T##String?#>,
//            imageUrl: thumbnailURL,
//            isBookmarked: <#T##Bool?#>,
//            brandName: <#T##String?#>,
//            isCheck: <#T##Bool#>,
//            englishName: engTitle,
//            koreanName: <#T##String?#>,
//            isExpress: isFast,
//            isCoupon: isCoupon,
//            isFreeShip: isFreeDevliver,
//            price: price,
//            isBuyNowPrice: <#T##Bool#>,
//            bookmarkCount: scrapCount,
//            heartCount: styleCount
//        )
//    }
}

// MARK: - SearchFindProductResponse
struct SearchFindProductResponse: Decodable {
    let thumbnailURL, brandTitle, engTitle, title: String
    let price, transactionCount, scrapCount, styleCount: String
    let isFast: Bool

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case brandTitle, engTitle, title, price, transactionCount, scrapCount, styleCount, isFast
    }
}

extension SearchFindProductResponse {
    func toItemDetail() -> ItemDetail {
        return .init(
            itemId: 0,
            isPreviouslySeen: false,
            tradeVolume: transactionCount,
            imageUrl: thumbnailURL,
            isBookmarked: nil,
            brandName: brandTitle,
            isCheck: false,
            englishName: engTitle,
            koreanName: title,
            isExpress: isFast,
            isCoupon: false, 
            isSave: false,
            isFreeShip: false,
            price: price,
            isBuyNowPrice: true,
            bookmarkCount: scrapCount,
            heartCount: styleCount
        )
    }
}
