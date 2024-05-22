//
//  TopSearchBarView.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class TopSearchBarView: UIView {
    
    // MARK: Properties
    // MARK: Views
    private let dismissButton = UIButton()
    private let searchTextField = UITextField()
    
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
            dismissButton,
            searchTextField
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        dismissButton.do {
            $0.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            $0.tintColor = .black02
        }
        
        searchTextField.do {
            $0.font = .kreamFont(.body4(.bold, isLh150: false))
            $0.attributedPlaceholder = "브랜드, 상품, 프로필, 태그 등".toKreamFontString(.body2(.semibold), textColor: .black08)
            $0.addPadding(left: 10)
            $0.backgroundColor = .gray06
            $0.layer.cornerRadius = 8
            $0.clearButtonMode = .whileEditing
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        dismissButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(dismissButton.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(44)
            $0.centerY.equalToSuperview()
        }
    }
}
