//
//  ReleaseInfoPageViewController.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import UIKit
import SnapKit
import Then

class ReleaseInfoPageViewController: UIViewController {
   
   private let customNavigationView = CustomNavigationView()
   private let segmentedControl = UnderlineSegmentedControl(items: ["시즌오프", "추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
   private let centerChipScrollView = CenterChipScrollView()
   private let releaseScrollView = UIScrollView()
   private let releaseContentView = UIView()
   private let testLuckyDrawView = UIView()
   private let releaseCollectionVC = ReleaseCollectionViewController()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
      setUpStyle()
      setUpLayout()
      setUpConstraint()
      self.addChild(releaseCollectionVC)
      releaseCollectionVC.didMove(toParent: self)
   }
   
   // MARK: setUpViews
   private func setUpViews() {
      
   }
   
   // MARK: setUpLayout
   private func setUpLayout() {
      self.view.addSubviews(customNavigationView, segmentedControl, releaseScrollView)
      releaseScrollView.addSubview(releaseContentView)
      releaseContentView.addSubviews(testLuckyDrawView, centerChipScrollView, releaseCollectionVC.view)
   }
   
   // MARK: setUpStyle
   private func setUpStyle() {
      self.navigationController?.navigationBar.isHidden = true
      self.view.backgroundColor = .white
      
      segmentedControl.do {
         $0.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
      }
      
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
      
      testLuckyDrawView.do {
         $0.backgroundColor = .blue03
      }
      
      releaseCollectionVC.collectionView.do {
         $0.isScrollEnabled = false
      }
   }
   
   // MARK: setUpConstraint
   private func setUpConstraint() {
      customNavigationView.snp.makeConstraints {
         $0.top.equalTo(view.safeAreaLayoutGuide)
         $0.horizontalEdges.equalToSuperview()
      }
      
      segmentedControl.snp.makeConstraints {
         $0.top.equalTo(customNavigationView.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.height.equalTo(44)
      }
      
      releaseScrollView.snp.makeConstraints {
         $0.top.equalTo(segmentedControl.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.bottom.equalToSuperview()
      }
      
      releaseContentView.snp.makeConstraints {
         $0.edges.equalToSuperview()
         $0.width.equalToSuperview()
         $0.height.greaterThanOrEqualToSuperview().priority(.low)
      }
      
      testLuckyDrawView.snp.makeConstraints {
         $0.top.equalToSuperview()
         $0.horizontalEdges.equalToSuperview()
         $0.height.equalTo(337)
      }
      
      centerChipScrollView.snp.makeConstraints {
         $0.top.equalTo(testLuckyDrawView.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.height.equalTo(57)
      }
      
      releaseCollectionVC.view.snp.makeConstraints {
         $0.top.equalTo(centerChipScrollView.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.bottom.equalToSuperview().inset(14)
      }
   }
   
   @objc
   private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
      for _ in 0..<1 {
         print("click")
      }
   }
   
}
