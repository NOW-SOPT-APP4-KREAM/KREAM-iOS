//
//  JustDroppedView.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class JustDroppedView: UIView {
    
    // MARK: Properties
    private let itemList: [ItemDetail] = []
    private let justDroppedLabel = UILabel()
    private let justDroppedKoreanLabel = UILabel()
    private let showMoreButton = UIButton()
    
    // MARK: Views
    private let justDroppedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = ItemType.full.cellSize
        $0.minimumLineSpacing = 7
        $0.scrollDirection = .horizontal
        $0.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    })
    
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
        justDroppedCollectionView.register(ItemInfoDetailCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoDetailCollectionViewCell.id)
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            justDroppedLabel,
            justDroppedKoreanLabel,
            showMoreButton,
            justDroppedCollectionView
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        justDroppedLabel.do {
            $0.attributedText = "Just Dropped".toKreamFontString(.head2(.heavy), textColor: .black02)
        }
        
        justDroppedKoreanLabel.do {
            $0.attributedText = "발매 상품".toKreamFontString(.custom(size: 13, weight: .semibold), textColor: .black06)
        }
        
        showMoreButton.do {
            $0.setAttributedTitle("더보기".toKreamFontString(.body4(.bold, isLh150: false), textColor: .black06), for: .normal)
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        justDroppedLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(16)
        }
        
        justDroppedKoreanLabel.snp.makeConstraints {
            $0.top.equalTo(justDroppedLabel.snp.bottom).offset(2)
            $0.leading.equalTo(justDroppedLabel)
        }
        
        showMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(justDroppedKoreanLabel)
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
}

#Preview {
    PreviewController(JustDroppedView(), snp: {
        $0.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(363)
        }
    })
}
