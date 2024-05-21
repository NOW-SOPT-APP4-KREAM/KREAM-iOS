//
//  testViewController.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import SnapKit
import Then
import UIKit

class TestViewController: UIViewController {
    
    let cell = ItemInfoDetailCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(cell)
        
        cell.configure(
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
        
        cell.snp.makeConstraints {
            $0.size.equalTo(ItemType.full.cellSize)
            $0.center.equalToSuperview()
        }
    }
}

#Preview {
    TestViewController()
}
