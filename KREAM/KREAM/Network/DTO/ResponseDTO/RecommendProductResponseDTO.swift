//
//  RecommendProductResponseDTO.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - RecommendProductResponseDTO
struct RecommendProductResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: RecommendProductDataClass
}

// MARK: - RecommendProductDataClass
struct RecommendProductDataClass: Decodable {
    let forYouList: [RecommendForYouList]
    let justDropList: [RecommendJustDropList]
}

// MARK: - ForYouList
struct RecommendForYouList: Decodable {
    let thumbnailURL: String
    let brandTitle: RecommendBrandTitle
    let engTitle, price, transactionCount: String

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case brandTitle, engTitle, price, transactionCount
    }
}

enum RecommendBrandTitle: String, Decodable {
    case adidas = "Adidas"
}

// MARK: - JustDropList
struct RecommendJustDropList: Decodable {
    let thumbnailURL: String
    let brandTitle: RecommendBrandTitle
    let engTitle, price, transactionCount: String
    let isScrap, isFast: Bool

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case brandTitle, engTitle, price, transactionCount, isScrap, isFast
    }
}
