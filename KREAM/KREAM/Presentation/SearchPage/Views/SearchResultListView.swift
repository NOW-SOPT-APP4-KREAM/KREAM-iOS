//
//  SearchResultListView.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class SearchResultListView: UIView {
    
    // MARK: Properties
    
    // MARK: Views
    // top section
    private let topSectionView = UIView()
    private let leftStack = UIStackView()
    private let magnifyImageView = UIImageView()
    private let searchTextLabel = UILabel()
    private let resultTextLabel = UILabel()
    private let moreButton = UIButton()
    
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
        
        // top section
        [
            magnifyImageView,
            searchTextLabel,
            resultTextLabel
        ].forEach { leftStack.addArrangedSubview($0) }
        
        [
            leftStack,
            moreButton
        ].forEach { topSectionView.addSubview($0) }
        
        [
            topSectionView
        ].forEach { self.addSubview($0) }
        
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        leftStack.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        magnifyImageView.do {
            $0.image = UIImage(systemName: "magnifyingglass")
            $0.tintColor = .black05
        }
        
        searchTextLabel.do {
            $0.text = "아디다스 흰색"
            $0.font = .kreamFont(.body2(.bold))
            $0.textColor = .black02
        }
        
        resultTextLabel.do {
            $0.attributedText = "검색결과".toKreamFontString(.body2(.bold), textColor: .black06)
        }
        
        moreButton.do {
            $0.setAttributedTitle(
                "더보기".toKreamFontString(
                    .body4(.bold, isLh150: false),
                    textColor: .black03
                ), for: .normal
            )
        }
    }
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        // top section
        topSectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        leftStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
        
    }
}

#Preview {
    PreviewController(SearchResultListView(), snp: { view in
        view.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(215)
        }
    })
}
