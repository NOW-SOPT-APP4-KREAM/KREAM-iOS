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
    private lazy var initColumnLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = cellType.cellSize
        $0.minimumLineSpacing = 7
        $0.sectionInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    private lazy var twoColumnLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = cellType.cellSize
        $0.minimumLineSpacing = 7
        $0.sectionInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    private lazy var threeColumnLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 109, height: 274) // 3열용 size
        $0.minimumLineSpacing = 7
        $0.sectionInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
    
    // MARK: Views
    private let scrollView = UIScrollView()
    private let topSearchBar = TopSearchBarView()
    private let searchSegmentControl = SearchSegmentControlView()
    private let filterTabView = SearchFilterTabsView()
    private let searchResultHeader = SearchResultHeaderView()
    private lazy var searchResultCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.initColumnLayout)
    private let relatedBackView = Divider(color: .gray05)
    private let searchRelatedListView = SearchRelatedListView()
    private lazy var secondSearchResultCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.twoColumnLayout)
    private let listBackView = Divider(color: .gray05)
    private let searchResultListView = SearchResultListView()
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLayout()
        setUpStyle()
        setUpConstraint()
        interface()
        adjustCollectionViewHeight()
    }
    
    // MARK: setUpViews
    private func setUpViews() {
        self.view.backgroundColor = .white
        
        searchResultCollectionView.register(ItemInfoDetailCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoDetailCollectionViewCell.id)
        searchResultCollectionView.dataSource = self
        
        secondSearchResultCollectionView.register(ItemInfoDetailCollectionViewCell.self, forCellWithReuseIdentifier: ItemInfoDetailCollectionViewCell.id)
        secondSearchResultCollectionView.dataSource = self
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            topSearchBar,
            searchSegmentControl,
            filterTabView,
            searchResultHeader,
            searchResultCollectionView,
            relatedBackView,
            searchRelatedListView,
            secondSearchResultCollectionView,
            listBackView,
            searchResultListView
        ].forEach { scrollView.addSubview($0) }
        
        self.view.addSubview(scrollView)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        searchResultCollectionView.do {
            $0.isScrollEnabled = false
        }
        
        secondSearchResultCollectionView.do {
            $0.isScrollEnabled = false
        }
        
        searchRelatedListView.do {
            $0.backgroundColor = .white
        }
        
        searchResultListView.do {
            $0.backgroundColor = .white
        }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        scrollView.contentLayoutGuide.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        topSearchBar.snp.makeConstraints {
            $0.top.equalTo(scrollView.contentLayoutGuide)
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
        
        relatedBackView.snp.makeConstraints {
            $0.top.equalTo(searchResultCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(323)
        }
        
        searchRelatedListView.snp.makeConstraints {
            $0.top.equalTo(relatedBackView).offset(7)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(relatedBackView).offset(-7)
        }
        
        secondSearchResultCollectionView.snp.makeConstraints {
            $0.top.equalTo(relatedBackView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1700)
        }
        
        listBackView.snp.makeConstraints {
            $0.top.equalTo(secondSearchResultCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(233)
            $0.bottom.equalTo(scrollView.contentLayoutGuide)
        }
        
        searchResultListView.snp.makeConstraints {
            $0.top.equalTo(listBackView).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(215)
            $0.bottom.equalTo(listBackView).offset(-10)
        }
    }
}

// MARK: Internal Logic
private extension SearchResultViewController {
    func adjustCollectionViewHeight() {
        // 데이터 로딩 후 컬렉션뷰의 높이 조정
        searchResultCollectionView.layoutIfNeeded()
        searchResultCollectionView.snp.updateConstraints {
            $0.height.equalTo(searchResultCollectionView.contentSize.height)
        }
        
        secondSearchResultCollectionView.layoutIfNeeded()
        secondSearchResultCollectionView.snp.updateConstraints {
            $0.height.equalTo(secondSearchResultCollectionView.contentSize.height)
        }
    }
}

// MARK: Interface
private extension SearchResultViewController {
    func interface() {
        _ = searchResultHeader.interface(
            input: .init(
                resultCount: "1,234",
                layoutChangeButtonDidTap: { column in
                    if column == 2 {
                        self.searchResultCollectionView.setCollectionViewLayout(
                            self.twoColumnLayout,
                            animated: true
                        )
                        self.secondSearchResultCollectionView.setCollectionViewLayout(
                            self.twoColumnLayout,
                            animated: true
                        )
                    } else {
                        self.searchResultCollectionView.setCollectionViewLayout(
                            self.threeColumnLayout,
                            animated: true)
                        self.secondSearchResultCollectionView.setCollectionViewLayout(
                            self.threeColumnLayout,
                            animated: true
                        )
                    }
                    self.adjustCollectionViewHeight()
                }
            )
        )
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
