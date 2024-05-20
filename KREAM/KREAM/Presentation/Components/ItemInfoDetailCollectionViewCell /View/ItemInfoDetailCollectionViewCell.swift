//
//  ItemInfoDetailCollectionViewCell .swift
//  KREAM
//
//  Created by 박민서 on 5/21/24.
//

import UIKit
import SnapKit
import Then

/// ItemInfoDetailCollectionViewCell의 Cell 표시 타입 enum입니다.
enum ItemType {
    case full
    case mid
    case compact
}

final class ItemDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    
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
        [
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
    }
}
