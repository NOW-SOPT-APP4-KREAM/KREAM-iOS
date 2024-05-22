//
//  UITextField+.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import UIKit

extension UITextField {
   
   /// TextField 기본 속성 커스텀
   func setTextField(
      forPlaceholder: String,
      forBorderColor: UIColor,
      forBorderWidth: CGFloat,
      forCornerRadius: CGFloat? = nil
   ) {
      self.placeholder = forPlaceholder
      self.clipsToBounds = true
      self.layer.borderColor = forBorderColor.cgColor
      self.layer.borderWidth = forBorderWidth
      self.backgroundColor = UIColor.white
      
      if let cornerRadius = forCornerRadius {
         self.layer.cornerRadius = cornerRadius
      } else {
         self.layer.cornerRadius = 0
      }
   }
   
   /// TextField 패딩 커스텀
   func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
      if let left {
         leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
         leftViewMode = .always
      }
      if let right {
         rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
         rightViewMode = .always
      }
   }
}
