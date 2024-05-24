//
//  ForYouView.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class ForYouView: UIView {
    
    // MARK: Properties
    private let cellType = ItemType.full
    private var itemList: [ItemDetail] = []
    
    // MARK: Views
    // top section
    private let forYouLabel = UILabel()
    private let forYouKoreanLabel = UILabel()
    private let questionButton = UIButton()
    private let dotsButton = UIButton()
    // mid section
    private let backView = UIView()
    private let itemImageView = UIImageView()
    private let itemLabel = UILabel()
    private let showMoreButton = UIButton()
    // content
    private let forYouCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 109, height: 165)
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 20
        $0.scrollDirection = .horizontal
        $0.sectionInset = .init(top: 17, left: 16, bottom: 17, right: 16)
    })
    // bottom section
    private let leftButton = UIButton()
    private let indicateLabel = UILabel()
    private let rightButton = UIButton()
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
//        justDroppedCollectionView.register(ItemInfoDetailCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoDetailCollectionViewCell.id)
//        justDroppedCollectionView.dataSource = self
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            forYouLabel,
            forYouKoreanLabel,
            questionButton,
            dotsButton,
            backView,
            itemImageView,
            itemLabel,
            showMoreButton,
            forYouCollectionView,
            leftButton,
            indicateLabel,
            rightButton,
            divider
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        forYouLabel.do {
            $0.attributedText = "For You".toKreamFontString(.head2(.heavy), textColor: .black02)
        }
        
        forYouKoreanLabel.do {
            $0.attributedText = "김송이님을 위해 준비해 봤어요.".toKreamFontString(.custom(size: 13, weight: .semibold), textColor: .black06)
        }
        
        showMoreButton.do {
            $0.setAttributedTitle("더보기".toKreamFontString(.body4(.bold, isLh150: false), textColor: .black06), for: .normal)
        }
        
        questionButton.do {
            $0.setImage(UIImage(resource: .icnQuestion), for: .normal)
        }
        
        dotsButton.do {
            $0.setImage(UIImage(resource: .icnDots), for: .normal)
        }
        
        backView.do {
            $0.backgroundColor = .gray07
            $0.layer.cornerRadius = 4
            $0.clipsToBounds = true
        }
        
        itemImageView.do {
            $0.backgroundColor = .gray06
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
        
        itemLabel.do {
            let fullText = "최근 본 뉴발란스 스니커즈의 추천 상품"
            let highlightedText = "뉴발란스 스니커즈"

            let fullRange = (fullText as NSString).range(of: fullText)
            let highlightedRange = (fullText as NSString).range(of: highlightedText)

            let attributedString = NSMutableAttributedString(string: fullText)
            let fullAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.kreamFont(.custom(size: 13, weight: .semibold)),
                .foregroundColor: UIColor.black01
            ]
            attributedString.addAttributes(fullAttributes, range: fullRange)

            let highlightedAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.kreamFont(.custom(size: 13, weight: .bold)),
                .foregroundColor: UIColor.blue02
            ]
            attributedString.addAttributes(highlightedAttributes, range: highlightedRange)
            
            $0.attributedText = attributedString
        }
        
        showMoreButton.do {
            $0.setAttributedTitle("더보기".toKreamFontString(.custom(size: 12, weight: .semibold), textColor: .black06), for: .normal)
        }
        
        leftButton.do {
            $0.setImage(UIImage(resource: .icnBefore), for: .normal)
        }
        
        indicateLabel.do {
            $0.attributedText = "1 /2".toKreamFontString(.custom(size: 14, weight: .semibold), textColor: .black06)
        }
        
        rightButton.do {
            $0.setImage(UIImage(resource: .icnAfter), for: .normal)
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        forYouLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(16)
        }
        
        forYouKoreanLabel.snp.makeConstraints {
            $0.top.equalTo(forYouLabel.snp.bottom).offset(2)
            $0.leading.equalTo(forYouLabel)
        }
        
        questionButton.snp.makeConstraints {
            $0.centerY.equalTo(forYouKoreanLabel)
            $0.leading.equalTo(forYouKoreanLabel.snp.trailing).offset(4)
        }
        
        dotsButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().offset(-8)
            $0.size.equalTo(24)
        }
        
        backView.snp.makeConstraints {
            $0.top.equalTo(forYouKoreanLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        
        itemImageView.snp.makeConstraints {
            $0.centerY.equalTo(backView)
            $0.leading.equalTo(backView).offset(8)
            $0.size.equalTo(30)
        }
        
        itemLabel.snp.makeConstraints {
            $0.leading.equalTo(itemImageView.snp.trailing).offset(8)
            $0.centerY.equalTo(itemImageView)
            $0.trailing.equalTo(showMoreButton.snp.leading).priority(.low)
        }
        
        showMoreButton.snp.makeConstraints {
            $0.trailing.equalTo(backView).offset(-16)
            $0.centerY.equalTo(itemImageView)
        }
        
        forYouCollectionView.snp.makeConstraints {
            $0.top.equalTo(backView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(384)
        }
        
        leftButton.snp.makeConstraints {
            $0.top.equalTo(forYouCollectionView.snp.bottom)
            $0.trailing.equalTo(indicateLabel.snp.leading).offset(-31)
        }
        
        indicateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(forYouCollectionView.snp.bottom).offset(11)
        }
        
        rightButton.snp.makeConstraints {
            $0.top.equalTo(forYouCollectionView.snp.bottom)
            $0.leading.equalTo(indicateLabel.snp.trailing).offset(31)
        }
        
        divider.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
        }
    }
}

extension ForYouView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemInfoDetailCollectionViewCell.id, for: indexPath) as? ItemInfoDetailCollectionViewCell else { return UICollectionViewCell() }
        
        _ = cell.interface(
            input: .init(itemType: self.cellType, itemDetail: itemList[indexPath.row], bookmarkButtonDidTap: {_ in})
        )
        return cell
    }
}

// MARK: External Function
extension ForYouView {
//    func configure(list: [ItemDetail]) {
//        self.itemList = list
//        self.justDroppedCollectionView.reloadData()
//    }
}

#Preview {
    PreviewController(ForYouView(), snp: {
        $0.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(565)
        }
    })
}

