//
//  ScrapResponseDTO.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import Foundation

// MARK: - ScrapResponseDTO
/// POST, DELETE DTO가 동일하여 하나로 통신
struct ScrapResponseDTO: Decodable {
    let status: Int
    let message: String
    let data: Data?
}
