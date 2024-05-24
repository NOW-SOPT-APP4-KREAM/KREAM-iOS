//
//  ItemCircleInfoView.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class ItemCircleInfoView: UIView {
    
    // MARK: Properties
    private let itemList: [(UIImage, String)] = [
        (UIImage(resource: .imgCricle01), "KREAM 카드"),
        (UIImage(resource: .imgCricle02), "크림 드로우"),
        (UIImage(resource: .imgCricle03), "남성 추천"),
        (UIImage(resource: .imgCricle04), "여성 추천"),
        (UIImage(resource: .imgCricle05), "색다른 추천"),
        (UIImage(resource: .imgCricle06), "정가 아래"),
        (UIImage(resource: .imgCricle07), "스프링 세일!"),
        (UIImage(resource: .imgCricle08), "샤넬 최대 -42%"),
        (UIImage(resource: .imgCricle09), "5월 혜택"),
        (UIImage(resource: .imgCricle10), "소니&슈프림 선물")
    ]
    
    // MARK: Views
    private let circleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = .init(width: 64, height: 96)
        $0.minimumLineSpacing = 6
        $0.minimumInteritemSpacing = 6
        $0.sectionInset = .init(top: 21, left: 16, bottom: 21, right: 16)
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
        circleCollectionView.register(ItemCircleInfoCollectionViewCell.self, forCellWithReuseIdentifier: ItemCircleInfoCollectionViewCell.id)
        circleCollectionView.dataSource = self
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        self.addSubview(circleCollectionView)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {

    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        circleCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ItemCircleInfoView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCircleInfoCollectionViewCell.id, for: indexPath) as? ItemCircleInfoCollectionViewCell else { return UICollectionViewCell() }
        cell.itemImageView.image = itemList[indexPath.row].0
        cell.itemTitleLabel.text = itemList[indexPath.row].1
        return cell
    }
    
}

//#Preview {
//    PreviewController(ItemCircleInfoView(), snp: {
//        $0.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.horizontalEdges.equalToSuperview()
//            $0.height.equalTo(242)
//        }
//    })
//}
