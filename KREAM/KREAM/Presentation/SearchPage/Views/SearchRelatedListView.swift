//
//  SearchRelatedListView.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class SearchRelatedListView: UIView {
    
    // MARK: Properties
    private let literalList = [
        "아디다스  흰색",
        "아디다스 다임",
        "아디다스 다임",
        "아디다스 오리지날",
        "아디다스 자메이카",
        "아디다스 00s",
        "아디다스 클래식",
        "아디다스 오리지널 반팔",
        "아디다스 골드",
        "아디다스 노랑"
    ]
    
    // MARK: Views
    private let relatedLabel = UILabel()
    private lazy var searchRelatedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 170, height: 42)
        $0.minimumLineSpacing = 3
        $0.minimumInteritemSpacing = 6
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
        searchRelatedCollectionView.register(SearchRelatedCollectionViewCell.self, forCellWithReuseIdentifier: SearchRelatedCollectionViewCell.id)
        searchRelatedCollectionView.dataSource = self
        searchRelatedCollectionView.isHidden = true
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            relatedLabel,
            searchRelatedCollectionView
        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
        relatedLabel.do {
            $0.attributedText = "연관 검색어".toKreamFontString(.body2(.bold), textColor: .black02)
        }
    }
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        relatedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        searchRelatedCollectionView.snp.makeConstraints {
            $0.top.equalTo(relatedLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
}

// MARK: External Function
extension SearchRelatedListView {
    func configure(isHidden: Bool) {
        searchRelatedCollectionView.isHidden = isHidden
    }
}

// MARK: UICollectionViewDataSource
extension SearchRelatedListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return literalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchRelatedCollectionViewCell.id,
            for: indexPath
        ) as? SearchRelatedCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(name: literalList[indexPath.row])
        return cell
    }
}
