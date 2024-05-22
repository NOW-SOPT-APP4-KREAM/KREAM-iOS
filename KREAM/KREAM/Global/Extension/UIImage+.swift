//
//  UIImage+.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit

extension UIImage {
    /// UIImage를 해당 사이즈에 맞게 리사이즈한 UIImage로 반환합니다.
    /// - parameter type: 재적용할 이미지 사이즈
    /// - Returns :resize된 이미지
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
