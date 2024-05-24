//
//  CardInfoCollectionViewCell.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class CardInfoCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    static let id = "CardInfoCollectionViewCell"
    // MARK: Views
    let itemImageView = UIImageView()
    let itemTitleLabel = UILabel()
    
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
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        itemTitleLabel.do {
            $0.font = .kreamFont(.custom(size: 12, weight: .semibold))
            $0.textColor = .white
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        itemImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        itemTitleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
