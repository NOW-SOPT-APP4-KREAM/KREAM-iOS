//
//  ProductResponseDTO.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - ProductResponseDTO
//struct ProductResponseDTO: Decodable {
//    let status: Int
//    let message: String
//    let data: ProductDataClass
//}
//
//// MARK: - ProductDataClass
//struct ProductDataClass: Decodable {
//    let searchFindProductResponses: [SearchFindProductResponse]
//    let relateRecommendProductResponses: [RelateRecommendProductResponse]
//}

//// MARK: - RelateRecommendProductResponse
//struct RelateRecommendProductResponse: Decodable {
//    let thumbnailURL: String
//    let engTitle: String
//    let price: String
//    let isFast: Bool
//    let scrapCount, styleCount: String
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnailURL = "thumbnailUrl"
//        case engTitle, price, isFast, scrapCount, styleCount
//    }
//}
//
////enum Title: String, Decodable {
////    case adidas = "Adidas"
////}
//
//// MARK: - SearchFindProductResponse
//struct SearchFindProductResponse: Decodable {
//    let thumbnailURL: String
//    let brandTitle: String
//    let engTitle, title, price, transactionCount: String
//    let scrapCount, styleCount: String
//    let isFast: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case thumbnailURL = "thumbnailUrl"
//        case brandTitle, engTitle, title, price, transactionCount, scrapCount, styleCount, isFast
//    }
//}

// MARK: - Welcome
struct ProductResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: ProductDataClass
}

// MARK: - DataClass
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
