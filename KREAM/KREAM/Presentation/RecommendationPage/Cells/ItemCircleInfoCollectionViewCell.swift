//
//  ItemCircleInfoCollectionViewCell.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class ItemCircleInfoCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    // MARK: Views
    private let itemImageView = UIImageView()
    private let itemTitleLabel = UILabel()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpLayout()
        setUpStyle()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpViews
    private func setUpViews() {
        
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        self.addSubviews(itemImageView, itemTitleLabel)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        itemImageView.do {
            $0.backgroundColor = .gray06
            $0.layer.cornerRadius = 32
            $0.clipsToBounds = true
        }
        
        itemTitleLabel.do {
            $0.font = .kreamFont(.body6(.semibold))
            $0.textColor = .black02
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(itemImageView.snp.width)
        }
        
        itemTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(itemImageView.snp.bottom).offset(6)
        }
    }
}

//#Preview{
//    PreviewController(ItemCircleInfoCollectionViewCell(), snp: {
//        $0.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.width.equalTo(64)
//            $0.height.equalTo(96)
//        }
//    })
//}

