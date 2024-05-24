//
//  ReleaseProductResponseDTO.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - ReleaseProductResponseDTO
struct ReleaseProductResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: ReleaseProductDataClass
}

// MARK: - ReleaseProductDataClass
struct ReleaseProductDataClass: Decodable {
    let releaseProducts: [ReleaseProduct]
}

// MARK: - ReleaseProduct
struct ReleaseProduct: Decodable {
    let thumbnailURL: String
    let brandTitle: BrandTitle
    let engTitle: String
    let isScrap, isUpdate, isNew: Bool

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case brandTitle, engTitle, isScrap, isUpdate, isNew
    }
}

enum BrandTitle: String, Decodable {
    case adidas = "Adidas"
}

extension ReleaseProduct {
   func toItemModel() -> ItemModel {
      return .init(
         itemURL: thumbnailURL,
         brandTitle: brandTitle.rawValue,
         engTitle: engTitle,
         isScrap: isScrap,
         isUpdate: isUpdate,
         isNew: isNew
      )
   }
}
