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
   
   let customNavigationView = CustomNavigationView()
   private let segmentedControl = UnderlineSegmentedControl(items: ["시즌오프", "추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
   let centerChipScrollView = CenterChipScrollView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
      setUpStyle()
      setUpLayout()
      setUpConstraint()
      changeTitleColorOfFirstSegment()
   }
   
   // MARK: setUpViews
   private func setUpViews() {
      
   }
   
   // MARK: setUpLayout
   private func setUpLayout() {
      self.view.addSubviews(customNavigationView, segmentedControl, centerChipScrollView)
   }
   
   // MARK: setUpStyle
   private func setUpStyle() {
      self.navigationController?.navigationBar.isHidden = true
      self.view.backgroundColor = .white
      
      segmentedControl.do {
         $0.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
      }
      
      centerChipScrollView.do {
         $0.showsHorizontalScrollIndicator = false
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
      
      centerChipScrollView.snp.makeConstraints {
         $0.top.equalTo(segmentedControl.snp.bottom)
         $0.horizontalEdges.equalToSuperview()
         $0.height.equalTo(57)
      }
   }
   
   private func changeTitleColorOfFirstSegment() {
      if let title = segmentedControl.titleForSegment(at: 0) {
         let attributedTitle = NSAttributedString(string: title, attributes: [
            .foregroundColor: UIColor.brown,
            .font: UIFont.systemFont(ofSize: 16) // 원하는 폰트로 조정하세요.
         ])
         segmentedControl.setTitle(attributedTitle.string, forSegmentAt: 0)
      }
   }
   
   @objc
   private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
      for i in 0..<1 {
         print("click")
         //               segmentViews[i].isHidden = i != sender.selectedSegmentIndex
      }
   }
   
}

#Preview {
   ReleaseInfoPageViewController()
}
