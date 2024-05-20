//
//  ItemInfoDetailCollectionViewCell .swift
//  KREAM
//
//  Created by 박민서 on 5/21/24.
//

import SnapKit
import Then
import UIKit

final class HOLDED_ItemDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    // image section
    private let imageView = UIImageView()
    private let isSeenTag = UIButton() // none-interacting button
    private let purchaseCountLabel = UILabel()
    private let bookmarkButton = UIButton() // interacting button
    // title section
    private let titleSectionStack = UIStackView()
    private let brandName = UILabel()
    private let itemNameEng = UILabel()
    private let itemNameKor = UILabel()
    // bottom section
    private let bottomSectionStack = UIStackView()
    private let isExpressTag = UIButton() // none-interacting button
    //
    private let price = UILabel()
    private let isBuyNowPriceTag = UILabel()
    private let bookmarkCountTag = UIButton() // none-interacting button
    private let heartCountTag = UIButton() // none-interacting button
    
    // MARK: Properties
    static let id = "ItemDetailCollectionViewCell"
    
    // MARK: Input Propeties
    private var itemType: ItemType?
    private var itemDetail: ItemDetail?
    
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
        
        guard let type = self.itemType, let itemDetail = self.itemDetail else {
            print("cell에 type, itemDetail이 지정되지 않았습니다.")
            return
        }
        
        let titleViews = {
            switch type {
            case .full:
                return [
                    self.brandName,
                    self.itemNameEng,
                    self.itemNameKor
                ]
            case .bigMid, .smallMid:
                return [
                    self.brandName,
                    self.itemNameEng
                ]
            case .compact:
                return [self.itemNameEng]
            }
        }()
        
        titleViews.forEach { titleSectionStack.addSubview($0) }
        
        let priceViews = {
            var views = []
            views.append(self.price)
            if itemDetail.isBuyNowPrice { views.append(self.isBuyNowPriceTag) }
            return views
        }()
        
        let bottomViews = {
            var views = []
            if itemDetail.isExpress { views.append(self.isExpressTag) }
            if let _ = itemDetail.bookmarkCount, let _ = itemDetail.heartCount {
            }
            return views
        }()
        
        [
            imageView,
            isSeenTag,
            purchaseCountLabel,
            bookmarkButton,
            // title section
            brandName,
            itemNameEng,
            itemNameKor,
            // bottom section
            isExpressTag,
            price,
            isBuyNowPriceTag,
            bookmarkCountTag,
            heartCountTag
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
    }
}

// MARK: External Function
extension HOLDED_ItemDetailCollectionViewCell {
    /// Cell의 데이터를 설정합니다.
    func configure(itemType: ItemType, itemDetail: ItemDetail) {
        self.itemType = itemType
        self.itemDetail = itemDetail
    }
}
