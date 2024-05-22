//
//  Divider.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit

final class Divider: UIView {

    init(color: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
