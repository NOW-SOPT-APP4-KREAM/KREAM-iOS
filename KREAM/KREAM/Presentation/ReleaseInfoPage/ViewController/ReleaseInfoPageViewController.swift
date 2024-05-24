//
//  ReleaseInfoPageViewController.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import UIKit
import SnapKit
import Then

#Preview {
   ReleaseInfoPageViewController()
}

class ReleaseInfoPageViewController: UIViewController {
   private var selectedIndex = 0
   private let customNavigationView = CustomNavigationView()
   private let centerChipScrollView = CenterChipScrollView()
   private let anotherScrollView = AnotherScrollView() // 얘랑 교대
   private let releaseScrollView = UIScrollView()
   private let releaseContentView = UIView()
   private let testLuckyDrawView = UIImageView()
   private let releaseCollectionVC = ReleaseCollectionViewController()
   private let luckyDrawCollectionVC = LuckyDrawCollectionViewController()
   private let tabView = TabView()
   
   private let items = [
      "시즌오프",
      "추천",
      "랭킹",
      "발매정보",
      "럭셔리",
      "남성",
      "여성"
   ]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      tabView.dataSource = items
      handleScroll()
      setUpViews()
      setUpStyle()
      setUpLayout()
      setUpConstraint()
      toggleScrollView(index: selectedIndex)
   }
   
   // MARK: setUpViews
   private func setUpViews() {
      
   }
   
   // MARK: setUpLayout
   private func setUpLayout() {
      self.addChild(releaseCollectionVC)
      releaseCollectionVC.didMove(toParent: self)
      
      self.addChild(luckyDrawCollectionVC)
      luckyDrawCollectionVC.didMove(toParent: self)
      
      self.view.addSubviews(customNavigationView, tabView, releaseScrollView, anotherScrollView)
      releaseScrollView.addSubview(releaseContentView)
      releaseContentView.addSubviews(luckyDrawCollectionVC.view, centerChipScrollView, releaseCollectionVC.view)
   }
   
   // MARK: setUpStyle
   private func setUpStyle() {
      self.navigationController?.navigationBar.isHidden = true
      self.view.backgroundColor = .white
      
      releaseScrollView.do {
         $0.showsVerticalScrollIndicator = false
         $0.isUserInteractionEnabled = true
      }
      
      releaseContentView.do {
         $0.isUserInteractionEnabled = true
      }
      
      centerChipScrollView.do {
         $0.showsHorizontalScrollIndicator = false
         $0.isScrollEnabled = true
      }
      
//      testLuckyDrawView.do {
//         $0.backgroundColor = .blue03
//      }
      
      releaseCollectionVC.collectionView.do {
         $0.isScrollEnabled = false
      }
      
      anotherScrollView.do {
         $0.backgroundColor = .red02
      }
      
      tabView.didTap = { [weak self] index in
         guard let self else { return }
         self.selectedIndex = index // 선택된 인덱스 할당
         self.tabView.scroll(to: index)
         self.tabView.syncUnderlineView(index: index, underlineView: self.tabView.highlightView)
         self.toggleScrollView(index: index) // 선택된 인덱스에 따라 ScrollView 토글
      }
   }
   
   // MARK: setUpConstraint
   private func setUpConstraint() {
      customNavigationView.snp.makeConstraints {
         $0.top.equalTo(view.safeAreaLayoutGuide)
         $0.horizontalEdges.equalToSuperview()
      }
      
      tabView.snp.makeConstraints {
         $0.top.equalTo(customNavigationView.snp.bottom)
         $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
         $0.height.equalTo(48)
      }
      
      releaseScrollView.snp.makeConstraints {
         $0.top.equalTo(tabView.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.bottom.equalToSuperview()
      }
      
      anotherScrollView.snp.makeConstraints {
         $0.top.equalTo(tabView.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.bottom.equalToSuperview()
      }
      
      releaseContentView.snp.makeConstraints {
         $0.edges.equalToSuperview()
         $0.width.equalToSuperview()
         $0.height.greaterThanOrEqualToSuperview().priority(.low)
      }
      
      luckyDrawCollectionVC.view.snp.makeConstraints {
         $0.top.equalToSuperview()
         $0.horizontalEdges.equalToSuperview()
         $0.height.equalTo(337)
      }
      
      centerChipScrollView.snp.makeConstraints {
         $0.top.equalTo(luckyDrawCollectionVC.view.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.height.equalTo(57)
      }
      
      releaseCollectionVC.view.snp.makeConstraints {
         $0.top.equalTo(centerChipScrollView.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.bottom.equalToSuperview().inset(14)
      }
   }
   
   private func handleScroll() {
      tabView.syncUnderlineView(index: 0, underlineView: tabView.highlightView)
      
      tabView.didTap = { [weak self] index in
         guard let self else { return }
         tabView.scroll(to: index)
         tabView.syncUnderlineView(index: index, underlineView: tabView.highlightView)
      }
   }
   
   private func toggleScrollView(index: Int) {
      if index == 1 { // '추천' 인덱스 1
         releaseScrollView.isHidden = true
         anotherScrollView.isHidden = false
      } else {
         releaseScrollView.isHidden = false
         anotherScrollView.isHidden = true
      }
   }
   
}
