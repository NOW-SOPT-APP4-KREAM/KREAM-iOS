//
//  DetailProductResponseDTO.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - DetailProductResponseDTO
struct DetailProductResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: DetailProductDataClass
}

// MARK: - DetailProductDataClass
struct DetailProductDataClass: Decodable {
    let thumbnailURL: String
    let price, engTitle, title, recentPrice: String
    let variablePrice, variablePercent, releasePrice, modelNumber: String
    let releaseDate, styleCount: String
    let styles: [Style]
    let isScrap: Bool
    let scrapCount, cellPrice: String

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case price, engTitle, title, recentPrice, variablePrice, variablePercent, releasePrice, modelNumber, releaseDate, styleCount, styles, isScrap, scrapCount, cellPrice
    }
}

// MARK: - Style
struct Style: Decodable {
    let imageURL: String
    let isVideo: Bool

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case isVideo
    }
}
