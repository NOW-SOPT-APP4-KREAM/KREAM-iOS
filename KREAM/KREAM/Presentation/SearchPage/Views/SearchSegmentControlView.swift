//
//  SearchSegmentControlView.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit
import SnapKit
import Then

enum SearchType: String {
    case product = "상품"
    case style = "스타일"
    case profile = "프로필"
}

final class SearchSegmentControlView: UIView {
    
    // MARK: Properties
    private var selectedTab: SearchType = .product {
        didSet {
            setUpStyle()
        }
    }
    
    // MARK: Views
    private let segmentStack = UIStackView()
    private let productButton = UIButton()
    private let styleButton = UIButton()
    private let profileButton = UIButton()
    private let underlineDivider = Divider(color: .black01)
    private let divider = Divider(color: .gray05)
    
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
            productButton,
            styleButton,
            profileButton
        ].forEach { segmentStack.addArrangedSubview($0) }
        
        [
            segmentStack,
            divider,
            underlineDivider
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        segmentStack.do {
            $0.axis = .horizontal
            $0.spacing = 24
            $0.distribution = .equalSpacing
        }
        
        productButton.do {
            $0.titleLabel?.text = SearchType.product.rawValue
            applySelectUI(to: $0, isSelected: false)
        }
        
        styleButton.do {
            $0.titleLabel?.text = SearchType.style.rawValue
            applySelectUI(to: $0, isSelected: true)
        }
        
        profileButton.do {
            $0.titleLabel?.text = SearchType.profile.rawValue
            applySelectUI(to: $0, isSelected: false)
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        segmentStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.verticalEdges.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        underlineDivider.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
}

// MARK: Internal Function
private extension SearchSegmentControlView {
    func applySelectUI(to button: UIButton, isSelected: Bool) {
        guard let text = button.titleLabel?.text else { return }
        
        let attrString = NSMutableAttributedString(string: text)
        attrString.setAttributes(
            [
                .font: isSelected ? UIFont.kreamFont(.body2(.bold)) : UIFont.kreamFont(.custom(size: 16, weight: .regular)),
                .foregroundColor: UIColor.black02
            ],
            range: NSRange(location: 0, length: attrString.length)
        )
        button.setAttributedTitle(attrString, for: .normal)
        if isSelected { moveSelectedLine(below: button) }
    }
    
    func moveSelectedLine(below button: UIButton) {
        underlineDivider.snp.updateConstraints {
            $0.horizontalEdges.equalTo(button)
        }
    }
}

#Preview {
    TestVC()
}

class TestVC: UIViewController {
    
    let control = SearchSegmentControlView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(control)
        control.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
