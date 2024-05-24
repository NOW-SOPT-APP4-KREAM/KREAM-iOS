//
//  ProductImageCell.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit

class ProductImageCell: UICollectionViewCell {
    static let identifier = "ProductImageCell"
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
