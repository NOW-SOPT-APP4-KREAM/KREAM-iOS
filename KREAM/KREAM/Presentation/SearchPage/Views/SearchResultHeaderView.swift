//
//  SearchResultHeaderView.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import UIKit
import SnapKit
import Then

enum SearchResultColumn: Int {
    case two = 2
    case three = 3
}

final class SearchResultHeaderView: UIView {
    
    // MARK: Properties
    private var columns: SearchResultColumn = .two {
        didSet {
            refreshUI()
        }
    }
    
    // MARK: Views
    private let resultCountLabel = UILabel()
    private let filterButton = UIButton()
    private let layoutChangeButton = UIButton()
    private let divider = Divider(color: .gray06)
    
    // MARK: Input Functions
    private var layoutChange: ((_ columns: Int) -> Void)?
    
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
        layoutChangeButton.addTarget(self, action: #selector(layoutChangeButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            resultCountLabel,
            filterButton,
            layoutChangeButton,
            divider
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        resultCountLabel.do {
            $0.text = "상품"
            $0.font = .kreamFont(.body5(.semibold))
            $0.textColor = .black04
        }
        
        filterButton.do {
            var configuration = UIButton.Configuration.filled()
            
            // 기본 설정
            configuration.baseBackgroundColor = .clear
            configuration.contentInsets = .zero
            
            // 이미지 설정
            let image = UIImage(systemName: "arrow.up.arrow.down")?.resized(to: .init(width: 16, height: 16))?.withRenderingMode(.alwaysTemplate)
            configuration.baseForegroundColor = .black06
            configuration.image = image
            configuration.imagePadding = 1
            configuration.imagePlacement = .trailing
            
            $0.configuration = configuration
            $0.setAttributedTitle("인기순".toKreamFontString(.body4(.bold, isLh150: false), textColor: .black01), for: .normal)
        }
        
        layoutChangeButton.do {
            $0.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
            $0.tintColor = .black06
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        resultCountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        layoutChangeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(16)
        }
        
        divider.snp.makeConstraints {
            $0.height.equalTo(12)
            $0.width.equalTo(1)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(layoutChangeButton.snp.leading).offset(-4)
        }
        
        filterButton.snp.makeConstraints {
            $0.trailing.equalTo(divider.snp.leading).offset(-4)
            $0.centerY.equalToSuperview()
        }
    }
}

// MARK: Internal Logic
private extension SearchResultHeaderView {
    func refreshUI() {
        // column 버튼 UI refresh
        switch self.columns {
            
        case .two:
            self.layoutChangeButton.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        case .three:
            self.layoutChangeButton.setImage(UIImage(systemName: "square.grid.3x3"), for: .normal)
        }
    }
}

// MARK: External Function
private extension SearchResultHeaderView {
    @objc func layoutChangeButtonDidTap() {
        self.columns = (self.columns == .two) ? .three : .two
        self.layoutChange?(self.columns.rawValue)
    }
}

// MARK: ComponentType
extension SearchResultHeaderView: ComponentType {
    func interface(input: Input) -> Output {
        self.resultCountLabel.text = "상품 \(input.resultCount)"
        return Output()
    }
    
    struct Input {
        let resultCount: String
        let layoutChangeButtonDidTap: (_ columns: Int) -> Void
    }
    
    struct Output {}
}
