//
//  ItemDataStackViewCell.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class ItemDataStackViewCell: UIView {
    
    // MARK: Properties
    // MARK: Views
    private let detailStackView = UIStackView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let bottomStackView = UIStackView()
    private let waveImage = UIImageView()
    private let waveLabel = UILabel()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpLayout()
        setUpStyle()
        setUpConstraint()
//        self.configure(title: "최근 거래가", content: "132,000원", wave: "16,000(-10.8%)")
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
            waveImage,
            waveLabel
        ].forEach { bottomStackView.addArrangedSubview($0) }
        
        [
            titleLabel,
            priceLabel,
            bottomStackView
        ].forEach { detailStackView.addArrangedSubview($0) }
        
        self.addSubviews(detailStackView)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        detailStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
        }
        
        titleLabel.do {
            $0.font = .kreamFont(.body6(.semibold))
            $0.textColor = .black06
            $0.numberOfLines = 0
        }
        
        priceLabel.do {
            $0.font = .kreamFont(.body5(.semibold))
            $0.textColor = .black03
            $0.numberOfLines = 0
        }
        
        waveImage.do {
            $0.image = UIImage(named: "icn_down")
        }
        
        waveLabel.do {
            $0.font = .kreamFont(.body6(.bold))
            $0.textColor = .green02
        }
        
    }
    // MARK: setUpConstraint
    private func setUpConstraint() {
        self.snp.makeConstraints {
            $0.height.equalTo(45)
        }
        
        detailStackView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
    }
}

// MARK: External Function
extension ItemDataStackViewCell {
    func configure(title: String, content: String, wave: UIImage?) {
        self.titleLabel.text = title
        self.priceLabel.text = content
        
        if let waveImage = wave {
            self.waveImage.image = waveImage
            self.bottomStackView.isHidden = false
        } else {
            self.bottomStackView.isHidden = true
        }
    }
}
