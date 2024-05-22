//
//  SearchResultViewController.swift
//  KREAM
//
//  Created by 박민서 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class SearchResultViewController: UIViewController {
    
    // MARK: Properties
    private let cellType: ItemType = .full
    private lazy var twoColumnLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = cellType.cellSize
        $0.minimumLineSpacing = 7
        $0.sectionInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    private lazy var threeColumnLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 109, height: cellType.cellSize.height)
        $0.minimumLineSpacing = 7
        $0.sectionInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    // MARK: Views
    private let topSearchBar = TopSearchBarView()
    private let searchSegmentControl = SearchSegmentControlView()
    private let filterTabView = SearchFilterTabsView()
    private let searchResultHeader = SearchResultHeaderView()
    private lazy var searchResultCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.twoColumnLayout)
    private let searchRelatedListView = SearchRelatedListView()
    private let searchResultListView = SearchResultListView()
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLayout()
        setUpStyle()
        setUpConstraint()
    }
    
    // MARK: setUpViews
    private func setUpViews() {
        searchResultCollectionView.register(ItemInfoDetailCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoDetailCollectionViewCell.id)
        searchResultCollectionView.dataSource = self
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            topSearchBar,
            searchSegmentControl,
            filterTabView,
            searchResultHeader,
            searchResultCollectionView,
            searchRelatedListView,
            searchResultListView
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        topSearchBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        searchSegmentControl.snp.makeConstraints {
            $0.top.equalTo(topSearchBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(43)
        }
        
        filterTabView.snp.makeConstraints {
            $0.top.equalTo(searchSegmentControl.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        searchResultHeader.snp.makeConstraints {
            $0.top.equalTo(filterTabView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(32)
        }
        
        searchResultCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchResultHeader.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1700)
        }
        
        searchResultListView.snp.makeConstraints {
            $0.top.equalTo(searchResultCollectionView.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(310)
        }
        
        searchRelatedListView.snp.makeConstraints {
            $0.top.equalTo(searchResultListView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(215)
        }
    }
}

// MARK: UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
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
                    isPreviouslySeen: false, // 고정
                    tradeVolume: "1.5만",
                    imageUrl: "",
                    isBookmarked: nil,
                    brandName: "ASDF",
                    isCheck: false, // 고정
                    englishName: "asdfasdfasdfkaujh",
                    koreanName: "ㅁㄴㅇㄹㅁㄴㅇㄹ",
                    isExpress: true,
                    isCoupon: false,
                    isFreeShip: false,
                    price: "123124원",
                    isBuyNowPrice: true,
                    bookmarkCount: "1.4만",
                    heartCount: "1.2만"
                ),
                bookmarkButtonDidTap: { print($0 ?? -1) }
            )
        )
        return cell
    }
}

#Preview {
    SearchResultViewController()
}
