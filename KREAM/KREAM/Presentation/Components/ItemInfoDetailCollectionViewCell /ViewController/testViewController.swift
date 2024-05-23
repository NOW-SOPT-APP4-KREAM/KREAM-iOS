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
        
        let cellType = ItemType.full
        
//        cell.configure(
//            itemType: cellType,
//            itemDetail: ItemDetail(
//                itemId: 1,
//                isPreviouslySeen: true,
//                tradeVolume: "4,532",
//                imageUrl: "asdf",
//                isBookmarked: false,
//                brandName: "New Balance",
//                isCheck: true,
//                englishName: "Adidas German Adicolor Classic 3-Stripe T- shirt Black",
//                koreanName: "Afsd",
//                isExpress: true,
//                isCoupon: false,
//                isFreeShip: false,
//                price: "447,000원",
//                isBuyNowPrice: true,
//                bookmarkCount: "asdf",
//                heartCount: "asdf"
//            )
//        )
        
//        cell.backgroundColor = .red
        
        cell.interface(input: .init(
            itemType: cellType,
            itemDetail: ItemDetail(
                itemId: 1,
                isPreviouslySeen: true,
                tradeVolume: "4,532",
                imageUrl: "https://www.dictionary.com/e/wp-content/uploads/2018/03/asdfmovie-300x300.jpg",
                isBookmarked: false,
                brandName: "New Balance",
                isCheck: true,
                englishName: "Adidas German Adicolor Classic 3-Stripe T- shirt Black",
                koreanName: "Afsd",
                isExpress: true,
                isCoupon: false, 
                isSave: false,
                isFreeShip: false,
                price: "447,000원",
                isBuyNowPrice: true,
                bookmarkCount: "asdf",
                heartCount: "asdf"),
            bookmarkButtonDidTap: { id in
                print(id)
            }
        ))
        
        cell.snp.makeConstraints {
            $0.size.equalTo(cellType.cellSize)
            $0.center.equalToSuperview()
        }
    }
}

#Preview {
    TestViewController()
}
