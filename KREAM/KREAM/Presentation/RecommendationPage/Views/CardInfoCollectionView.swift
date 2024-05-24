//
//  CardInfoCollectionView.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class CardInfoCollectionView: UIView {
    
    // MARK: Properties
    private let itemList: [(UIImage, String)] = [
        (UIImage(resource: .imgStyle01), "se0o_02"),
        (UIImage(resource: .imgStyle02), "kiru_day"),
        (UIImage(resource: .imgStyle03), "frank0p4"),
        (UIImage(resource: .imgStyle04), "0gonge"),
        (UIImage(resource: .imgStyle05), "sin_tt_99")
    ]
    
    // MARK: Views
    private let titleLabel = UILabel()
    
    private let cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = .init(width: 126, height: 168)
        $0.minimumLineSpacing = 8
        $0.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        $0.scrollDirection = .horizontal
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
        cardCollectionView.register(CardInfoCollectionViewCell.self, forCellWithReuseIdentifier: CardInfoCollectionViewCell.id)
        cardCollectionView.dataSource = self
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        self.addSubviews(titleLabel, cardCollectionView)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        titleLabel.do {
            $0.attributedText = "애매한 날씨에도 폭룡적인 코디센스".toKreamFontString(.body1(.bold), textColor: .black01)
        }
        
        cardCollectionView.do {
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(16)
        }
        
        cardCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

extension CardInfoCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardInfoCollectionViewCell.id, for: indexPath) as? CardInfoCollectionViewCell else { return UICollectionViewCell() }
        cell.itemImageView.image = itemList[indexPath.row].0
        cell.itemTitleLabel.text = itemList[indexPath.row].1
        return cell
    }
    
}

//#Preview {
//    PreviewController(CardInfoCollectionView(), snp: {
//        $0.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.horizontalEdges.equalToSuperview()
//            $0.height.equalTo(224)
//        }
//    })
//}
