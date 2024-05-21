//
//  ScrapRequestBody.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - ScrapRequestBody
/// POST, DELETE RequestBody가 동일하여 하나로 통신
struct ScrapRequestBody: Encodable {
    let productID: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
    }
}
