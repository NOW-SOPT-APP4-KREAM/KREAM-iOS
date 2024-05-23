//
//  SearchFilterTabsView.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit
import SnapKit
import Then

final class SearchFilterTabsView: UIView {
    
    // MARK: Properties

    // MARK: Views
    private let scrollView = UIScrollView()
    private let tabStack = UIStackView()
    private let freeShipBtn = UIButton()
    private let dividerContainerView = UIView()
    private let divider = Divider(color: .gray04)
    private let categoryBtn = UIButton()
    private let genderBtn = UIButton()
    private let colorBtn = UIButton()
    private let brandBtn = UIButton()
    private let sizeBtn = UIButton()
    private let benefitBtn = UIButton()
    
    // MARK: Internal Logic
    
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
        freeShipBtn.setTitle("빠른배송", for: .normal)
        categoryBtn.setTitle("카테고리", for: .normal)
        genderBtn.setTitle("성별", for: .normal)
        colorBtn.setTitle("색상", for: .normal)
        brandBtn.setTitle("브랜드", for: .normal)
        sizeBtn.setTitle("사이즈", for: .normal)
        benefitBtn.setTitle("혜택/가격", for: .normal)
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        
        dividerContainerView.addSubview(divider)
        
        [
            freeShipBtn,
            dividerContainerView,
            categoryBtn,
            genderBtn,
            colorBtn,
            brandBtn,
            sizeBtn,
            benefitBtn
        ].forEach { tabStack.addArrangedSubview($0) }
        
        scrollView.addSubview(tabStack)
        
        self.addSubview(scrollView)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        applyButtonUI(to: freeShipBtn, leftImage: true)
        
        [
            categoryBtn,
            genderBtn,
            colorBtn,
            brandBtn,
            sizeBtn,
            benefitBtn
        ].forEach { applyButtonUI(to: $0, rightImage: true)}
        
        tabStack.do {
            $0.axis = .horizontal
            $0.spacing = 6
            $0.distribution = .equalSpacing
        }
        
        scrollView.do {
            $0.bouncesVertically = false
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        dividerContainerView.snp.makeConstraints {
            $0.width.equalTo(1)
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(19)
            $0.width.equalTo(1)
            $0.center.equalToSuperview()
        }
        
        [
            freeShipBtn,
            categoryBtn,
            genderBtn,
            colorBtn,
            brandBtn,
            sizeBtn,
            benefitBtn
        ].forEach { $0.snp.makeConstraints { $0.height.equalTo(30) } }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tabStack.snp.makeConstraints {
            $0.verticalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.horizontalEdges.equalTo(scrollView.contentLayoutGuide).inset(16)
            $0.height.equalTo(30)
        }
        
    }
}

// MARK: Internal Function
private extension SearchFilterTabsView {
    func applyButtonUI(to button: UIButton, leftImage: Bool = false, rightImage: Bool = false) {
        var configuration = UIButton.Configuration.filled()
        
        // 배경 UI 설정
        configuration.baseBackgroundColor = .clear
        configuration.background.strokeColor = .gray04
        configuration.background.strokeWidth = 1
        configuration.background.cornerRadius = 20
        configuration.contentInsets = .init(top: 7, leading: 11, bottom: 7, trailing: 11)
        
        // 글자 관련 설정
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.kreamFont(.body4(.semibold, isLh150: false))
            outgoing.foregroundColor = UIColor.black02
            return outgoing
        }
        configuration.titleLineBreakMode = .byTruncatingTail
        
        // 좌측 이미지
        if leftImage {
            // TODO: 추후 이미지 변경
            let image = UIImage(resource: .icnBolt).resized(to: .init(width: 14, height: 16))?.withRenderingMode(.alwaysTemplate)
            configuration.baseForegroundColor = .green02
            configuration.image = image
            configuration.imagePadding = 4
            configuration.imagePlacement = .leading
        }
        
        // 우측 이미지
        if rightImage {
            // TODO: 추후 이미지 변경
            let image = UIImage(systemName: "chevron.down")?.resized(to: .init(width: 8, height: 4))?.withRenderingMode(.alwaysTemplate)
            configuration.baseForegroundColor = .gray03
            configuration.image = image
            configuration.imagePadding = 4
            configuration.imagePlacement = .trailing
        }
        
        button.configuration = configuration
    }
}
