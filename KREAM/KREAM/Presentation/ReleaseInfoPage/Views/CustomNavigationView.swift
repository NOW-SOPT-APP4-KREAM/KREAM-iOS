//
//  CustomNavigationView.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import UIKit

import SnapKit
import Then

enum NavigationType {
   case alarm
   case cancel
}

final class CustomNavigationView: UIView {
   
   let searchTextField = UITextField()
   private let rightBtn = UIButton()
   var navigationType: NavigationType = .cancel {
      didSet {
         self.rightBtn.setAttributedTitle(nil, for: .normal)
         self.rightBtn.setTitle(nil, for: .normal)
         self.rightBtn.setImage(nil, for: .normal)
         setUpStyle()
      }
   }
   
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
      
   }
   
   // MARK: setUpLayout
   private func setUpLayout() {
      self.addSubviews(searchTextField, rightBtn)
   }
   
   // MARK: setUpStyle
   private func setUpStyle() {
      searchTextField.do {
         $0.addPadding(left: 10)
         $0.attributedPlaceholder = "브랜드, 상품, 프로필, 태그 등".toKreamFontString(.body2(.semibold), textColor: .black08)
         $0.backgroundColor = .gray06
         $0.layer.cornerRadius = 8
      }
      
      switch navigationType {
      case .alarm:
         rightBtn.do {
            $0.setImage(UIImage(resource: .icnAlarm), for: .normal)
         }
      case .cancel:
         rightBtn.do {
            $0.setAttributedTitle(
               "취소".toKreamFontString(.body2(.bold), textColor: .black02),
               for: .normal
            )
         }
      }
   }
   
   // MARK: setUpConstraint
   private func setUpConstraint() {
      self.snp.makeConstraints {
         $0.height.equalTo(44)
      }
      
      searchTextField.snp.makeConstraints {
         $0.leading.equalToSuperview().offset(16)
         $0.verticalEdges.equalToSuperview().inset(2.5)
         $0.trailing.equalToSuperview().inset(53)
      }
      
      rightBtn.snp.makeConstraints {
         $0.leading.equalTo(searchTextField.snp.trailing).offset(4)
         $0.top.bottom.equalToSuperview()
         $0.trailing.equalToSuperview().inset(5)
      }
   }
   
}
