//
//  SearchRelatedCollectionViewCell.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import SnapKit
import Then
import UIKit

final class SearchRelatedCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    static let id = "SearchRelatedCollectionViewCell"
    // MARK: Views
    private let backView = UIView()
    private let magnifyImageView = UIImageView()
    private let textLabel = UILabel()
    
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
        [
            backView,
            magnifyImageView,
            textLabel
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        backView.do {
            $0.backgroundColor = .gray07
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray06.cgColor
        }
        
        magnifyImageView.do {
            $0.image = UIImage(resource: .icnMagnifier)
            $0.tintColor = .black06
        }
        
        textLabel.do {
            $0.text = "asdf"
            $0.font = .kreamFont(.body3(.bold))
            $0.textColor = .black02
            $0.numberOfLines = 2
            $0.lineBreakMode = .byTruncatingTail
        }
    }
    // MARK: setUpConstraint
    private func setUpConstraint() {
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        magnifyImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        textLabel.snp.makeConstraints {
            $0.leading.equalTo(magnifyImageView.snp.trailing).offset(12)
            $0.trailing.equalToSuperview().offset(-23)
            $0.centerY.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(4).priority(.low)
        }
    }
}

extension SearchRelatedCollectionViewCell {
    func configure(name: String) {
        self.textLabel.text = name
    }
}
