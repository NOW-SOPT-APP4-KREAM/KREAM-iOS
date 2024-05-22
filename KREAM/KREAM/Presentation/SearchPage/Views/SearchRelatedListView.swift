//
//  SearchRelatedListView.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class SearchRelatedListView: UIView {
    
    // MARK: Properties
    // MARK: Views
    // top section
    private let relatedLabel = UILabel()
    
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
            relatedLabel
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        relatedLabel.do {
            $0.attributedText = "연관 검색어".toKreamFontString(.body2(.bold), textColor: .black02)
        }
    }
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        relatedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
}

#Preview {
    PreviewController(SearchRelatedListView(), snp: { view in
        view.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(375)
        }
    })
}
