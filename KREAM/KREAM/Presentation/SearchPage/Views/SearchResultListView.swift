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
    private let cellType = ItemType.compact
    
    // MARK: Views
    // top section
    private let topSectionView = UIView()
    private let leftStack = UIStackView()
    private let magnifyImageView = UIImageView()
    private let searchTextLabel = UILabel()
    private let resultTextLabel = UILabel()
    private let moreButton = UIButton()
    // bottom section
    private lazy var SearchResultLineListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = cellType.cellSize
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 6
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
        SearchResultLineListCollectionView.register(ItemInfoDetailCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoDetailCollectionViewCell.id)
        SearchResultLineListCollectionView.dataSource = self
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
            topSectionView,
            SearchResultLineListCollectionView
        ].forEach { self.addSubview($0) }
        
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        leftStack.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        magnifyImageView.do {
            $0.image = UIImage(resource: .icnMagnifier)
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
        
        SearchResultLineListCollectionView.do {
            $0.showsHorizontalScrollIndicator = false
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
        
        SearchResultLineListCollectionView.snp.makeConstraints {
            $0.top.equalTo(topSectionView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-18)
        }
        
    }
}

// MARK: UICollectionViewDataSource
extension SearchResultListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemInfoDetailCollectionViewCell.id,
            for: indexPath
        ) as? ItemInfoDetailCollectionViewCell else { return UICollectionViewCell() }
        _ = cell.interface(
            input: .init(
                itemType: self.cellType,
                itemDetail: .init(
                    itemId: 1,
                    isPreviouslySeen: false,
                    tradeVolume: nil,
                    imageUrl: "",
                    isBookmarked: nil,
                    brandName: nil,
                    isCheck: false,
                    englishName: "aidadasad",
                    koreanName: nil,
                    isExpress: false,
                    isCoupon: false,
                    isFreeShip: false,
                    price: "1-0194=won",
                    isBuyNowPrice: false,
                    bookmarkCount: nil,
                    heartCount: nil
                ),
                bookmarkButtonDidTap: {_ in}
            )
        )
        return cell
    }
}
