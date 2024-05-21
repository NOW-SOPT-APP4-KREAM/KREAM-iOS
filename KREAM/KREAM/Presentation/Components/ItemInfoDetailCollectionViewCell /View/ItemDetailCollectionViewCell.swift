//
//  ItemInfoDetailCollectionViewCell .swift
//  KREAM
//
//  Created by 박민서 on 5/21/24.
//

import SnapKit
import Then
import UIKit

final class ItemInfoDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    // image section
    private let imageView = UIImageView()
    private let isSeenTag = UIButton() // none-interacting button
    private let purchaseCountLabel = UILabel()
    private let bookmarkButton = UIButton() // interacting button
    // title section
    private let titleSectionStack = UIStackView()
    private let titleStack = UIStackView()
    private let brandName = UILabel()
    private let checkMark = UIImageView()
    private let itemNameEng = UILabel()
    private let itemNameKor = UILabel()
    // tag section
    private let tagSectionStack = UIStackView()
    private let isExpressTag = UIButton() // none-interacting button
    private let isCouponTag = UIButton() // none-interacting button
    private let isFreeShipTag = UIButton() // none-interacting button
    // bottom section
    private let bottomSectionStack = UIStackView()
    private let priceStack = UIStackView()
    private let optionStack = UIStackView()
    private let price = UILabel()
    private let isBuyNowPriceTag = UILabel()
    private let bookmarkCountTag = UIButton() // none-interacting button
    private let heartCountTag = UIButton() // none-interacting button
    
    // MARK: Properties
    static let id = "ItemDetailCollectionViewCell"
    
    // MARK: Input Propeties
    private var itemType: ItemType?
    private var itemDetail: ItemDetail? {
        didSet {
            setUpStyle()
            setUpConstraint()
        }
    }
    
    // MARK: Input Functions
    // 매개변수로 들어가는 UIButton은 이곳의 Button입니다
    // 이곳에서 함수 실행 후 다시 return 받아야하는 값이 없기 때문에 `-> Void` 입니다.
//    private var bookmarkButtonDidTap: ((UIButton) -> Void)?
    
    // MARK: Output Functions
    // 매개변수로 들어가는 Bool은 외부에서 입력받는 값, Int는 itemDetail의 itemId입니다.
    // 외부에서 따로 return 받아야하는 값이 없기 때문에 `-> Void` 입니다.
    // 클로저 내부에서 self를 참조하고 있기 때문에 [weak self] 후 옵셔널 체크해줍니다.
    // 본 컴포넌트의 itemDetail.itemId가 입력받은 id와 같은 경우 previoslySeenTag의 숨김처리를 변경합니다.
//    private lazy var changePreviouslySeen: ((Int, Bool) -> Void) = { [weak self] id, isShow in
//        guard let self, self.itemDetail?.itemId == id else { return }
//        self.previoslySeenTag.isHidden = !isShow
//    }
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpViews
    private func setUpViews() {
        
    }
     
    // MARK: setUpLayout
    private func setUpLayout() {
        
        // title section
        [
            brandName,
            checkMark,
            UIView()
        ].forEach { titleStack.addArrangedSubview($0) }
        
        [
            titleStack,
            itemNameEng,
            itemNameKor
        ].forEach { titleSectionStack.addArrangedSubview($0) }
        
        // tag section
        [
            isExpressTag,
            isCouponTag,
            isFreeShipTag,
            UIView()
        ].forEach { tagSectionStack.addArrangedSubview($0) }
        
        // bottom section
        [
            price,
            isBuyNowPriceTag
        ].forEach { priceStack.addArrangedSubview($0) }
        
        [
            bookmarkCountTag,
            heartCountTag,
            UIView()
        ].forEach { optionStack.addArrangedSubview($0) }
        
        [
            priceStack,
            optionStack
        ].forEach { bottomSectionStack.addArrangedSubview($0) }
        
        [
            // image section
            imageView,
            isSeenTag,
            purchaseCountLabel,
            bookmarkButton,
            // title section
            titleSectionStack,
            // tag section
            tagSectionStack,
            // bottom section
            bottomSectionStack
            
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        // image section
        imageView.do {
            $0.image = UIImage(systemName: "tshirt.fill")
            $0.tintColor = .black03
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .gray06
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        isSeenTag.do {
            var config = UIButton.Configuration.filled()

            config.baseBackgroundColor = .blue02
            config.cornerStyle = .small
            config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.kreamFont(.custom(size: 9, weight: .semibold))
                return outgoing
            }
            
            $0.configuration = config
            $0.setTitle("내가 본", for: .normal)
        }
        
        purchaseCountLabel.do {
            $0.attributedText = "거래 309".toKreamFontString(.body6(.semibold), textColor: .black04)
        }
        
        bookmarkButton.do {
            // TODO: 추후 추가된 asset으로 변경
            if let bookmarked = self.itemDetail?.isBookmarked {
                $0.setImage(UIImage(systemName: bookmarked ? "bookmark.fill" : "bookmark"), for: .normal)
                $0.imageView?.tintColor = .black03
            }
        }
        
        // title section
        titleStack.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        titleSectionStack.do {
            $0.axis = .vertical
            $0.spacing = 2
        }
        
        brandName.do {
            $0.attributedText = "Adidas".toKreamFontString(.body4(.black, isLh150: false), textColor: .black02)
        }
        
        checkMark.do {
            $0.image = UIImage(systemName: "checkmark.circle.fill")
            $0.tintColor = .purple
        }
        
        itemNameEng.do {
            $0.numberOfLines = 2
            $0.attributedText = "Adidas German Adicolor Classic 3-Stripe T- shirt Black"
                .toKreamFontString(.body5(.semibold), textColor: .black02)
        }
        
        itemNameKor.do {
            $0.attributedText = "아디다스 독일 아디컬러 클래식 삼선  티셔츠".toKreamFontString(.body6(.regular), textColor: .black08)
        }
        
        // tag section
        tagSectionStack.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        isExpressTag.do {
            var config = UIButton.Configuration.filled()
            
            config.baseForegroundColor = .green02
            config.baseBackgroundColor = .green05
            config.cornerStyle = .small
            config.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
            // TODO: 추후 추가된 asset으로 변경
            config.image = UIImage(systemName: "bolt")?.resized(to: .init(width: 14, height: 16))?.withRenderingMode(.alwaysTemplate)
            config.imagePadding = 2
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.kreamFont(.body7(.regular))
                return outgoing
            }
            
            $0.configuration = config
            $0.setTitle("빠른배송", for: .normal)
        }
        
        isCouponTag.do {
            var config = UIButton.Configuration.filled()
            
            config.baseForegroundColor = .black05
            config.baseBackgroundColor = .gray05
            config.cornerStyle = .small
            config.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.kreamFont(.body7(.regular))
                return outgoing
            }
            
            $0.configuration = config
            $0.setTitle("쿠폰", for: .normal)
        }
        
        isFreeShipTag.do {
            var config = UIButton.Configuration.filled()
            
            config.baseForegroundColor = .black05
            config.baseBackgroundColor = .gray05
            config.cornerStyle = .small
            config.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.kreamFont(.body7(.regular))
                return outgoing
            }
            
            $0.configuration = config
            $0.setTitle("무료배송", for: .normal)
        }
        
        // bottom section
        
        bottomSectionStack.do {
            $0.axis = .vertical
            $0.spacing = 9
        }
        
        priceStack.do {
            $0.axis = .vertical
            $0.spacing = 3
        }
        
        optionStack.do {
            $0.axis = .horizontal
            $0.spacing = 12
        }
        
        price.do {
            $0.attributedText = "447,000원".toKreamFontString(.body4(.black, isLh150: false), textColor: .black02)
        }
        
        isBuyNowPriceTag.do {
            $0.attributedText = "즉시 구매가".toKreamFontString(.body7(.semibold), textColor: .black06)
        }
        
        bookmarkCountTag.do {
            // TODO: 추후 추가된 asset으로 변경
            $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
            $0.imageView?.tintColor = .black06
            $0.setAttributedTitle("3만".toKreamFontString(.body6(.semibold), textColor: .black06), for: .normal)
        }
        
        heartCountTag.do {
            // TODO: 추후 추가된 asset으로 변경
            $0.setImage(UIImage(systemName: "doc.plaintext"), for: .normal)
            $0.imageView?.tintColor = .black06
            $0.setAttributedTitle("104".toKreamFontString(.body6(.semibold), textColor: .black06), for: .normal)
        }
        
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        // image section
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.width.equalTo(imageView.snp.height)
        }
        
        isSeenTag.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(6)
        }
        
        purchaseCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.greaterThanOrEqualTo(isSeenTag.snp.trailing)
            $0.trailing.equalToSuperview().offset(-6)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(imageView).offset(-8)
            $0.size.equalTo(24)
        }
        
        // title section
        titleSectionStack.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
        }
        
        checkMark.snp.makeConstraints {
            $0.size.equalTo(12)
        }
        
        // tag section
        tagSectionStack.snp.makeConstraints {
            $0.top.equalTo(titleSectionStack.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
        }

        // bottom section
        bottomSectionStack.snp.makeConstraints {
            $0.top.equalTo(tagSectionStack.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-4)
        }
    }
}

// MARK: External Function
extension ItemInfoDetailCollectionViewCell {
    /// Cell의 데이터를 설정합니다.
    func configure(itemType: ItemType, itemDetail: ItemDetail) {
        self.itemType = itemType
        self.itemDetail = itemDetail
    }
}

#Preview {
    ItemInfoDetailCollectionViewCell().then {
        $0.configure(
            itemType: .full,
            itemDetail: ItemDetail(
                itemId: 1,
                isPreviouslySeen: true,
                tradeVolume: "거래 1.9만",
                imageUrl: "asdf",
                isBookmarked: true,
                brandName: "adidas",
                englishName: "Adidas German Adicolor Classic 3-Stripe T- shirt Black",
                koreanName: "아디다스 독일 아디컬러 클래식 삼선  티셔츠",
                isExpress: true,
                isCoupon: true,
                isFreeShip: true,
                price: "447,000원",
                isBuyNowPrice: true,
                bookmarkCount: "3만",
                heartCount: "104"
            )
        )
    }
}
