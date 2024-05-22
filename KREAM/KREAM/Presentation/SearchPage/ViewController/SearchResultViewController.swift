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
    // MARK: Views
    private let topSearchBar = TopSearchBarView()
    private let searchSegmentControl = SearchSegmentControlView()
    private let filterTabView = SearchFilterTabsView()
    private let searchResultHeader = SearchResultHeaderView()
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
        
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            topSearchBar,
            searchSegmentControl,
            filterTabView,
            searchResultHeader,
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
        
        searchResultListView.snp.makeConstraints {
            $0.top.equalTo(searchResultHeader.snp.bottom).offset(7)
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

#Preview {
    SearchResultViewController()
}
