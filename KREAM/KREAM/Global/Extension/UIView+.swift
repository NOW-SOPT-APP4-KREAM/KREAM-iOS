//
//  UIView+.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import UIKit

extension UIView {
   func addSubviews(_ views: UIView...) {
      views.forEach {
         self.addSubview($0)
      }
   }
} 
