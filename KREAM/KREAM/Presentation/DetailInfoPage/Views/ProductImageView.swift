//
//  ProductImageView.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import Then
import SnapKit

class ProductImageView : UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        setLayout()
        setUpStyle()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Set Elements
    private let productImage = UIView()
    
    //MARK: SetUp
    func setUpStyle(){
        productImage.do {
            $0.backgroundColor = .yellow01
        }
    }
    //MARK: - Layout
    private func setLayout(){
        addSubview(productImage)
    }
    private func setConstraints(){
        productImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.height.equalTo(375)
        }
    }
}
