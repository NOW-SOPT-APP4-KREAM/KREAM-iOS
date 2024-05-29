//
//  Product.swift
//  KREAM
//
//  Created by 송여경 on 5/29/24.
//

import Foundation

struct Product: Codable {
    let status: Int
    let message: String
    let data: ProductData
}

struct ProductData: Codable {
    let thumbnailUrl: String
    let price: String
    let engTitle: String
    let title: String
    let recentPrice: String
    let variablePrice: String
    let variablePercent: String
    let releasePrice: String
    let modelNumber: String
    let releaseDate: String
    let styleCount: String
    let styles: [ProductStyle]
    let isScrap: Bool
    let scrapCount: String
    let cellPrice: String
}

struct ProductStyle: Codable {
    let imageUrl: String
    let isVideo: Bool
}
