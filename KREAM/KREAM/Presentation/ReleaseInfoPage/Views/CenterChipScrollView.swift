//
//  CenterChipStackView.swift
//  KREAM
//
//  Created by 박신영 on 5/23/24.
//

import UIKit
import SnapKit

class CenterChipScrollView: UIScrollView {
   
   private let stackView = UIStackView()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setUpStyle()
      addLabels()
      setupViews()
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }
   
   private func addLabels() {
      (0...5).map {idx in
         let view = UIView().then {
            $0.backgroundColor = .gray05
            $0.layer.cornerRadius = 10
            $0.layer.borderColor = .none
         }
         
         if idx == 1 {
            view.snp.makeConstraints {
               $0.width.equalTo(1)
               $0.height.equalTo(23)
            }
         } else if idx == 0 {
            view.snp.makeConstraints {
               $0.height.equalTo(38)
               $0.width.equalTo(73)
            }
            
            let label = UILabel().then {
               $0.textColor = .black02
               $0.text = "오늘 응모"
               $0.font = .kreamFont(.body4(.bold, isLh150: false))
            }
            
            view.addSubview(label)
            
            label.snp.makeConstraints {
               $0.centerX.centerY.equalToSuperview()
            }
            
         } else if idx == 2 {
            view.snp.makeConstraints {
               $0.height.equalTo(38)
               $0.width.equalTo(50)
            }
            
            let label = UILabel().then {
               $0.textColor = .black02
               $0.text = "Nike"
               $0.font = .kreamFont(.body4(.heavy, isLh150: false))
            }
            
            view.addSubview(label)
            
            label.snp.makeConstraints {
               $0.centerX.centerY.equalToSuperview()
            }
         } else if idx == 3 {
            view.snp.makeConstraints {
               $0.height.equalTo(38)
               $0.width.equalTo(64)
            }
            
            let label = UILabel().then {
               $0.textColor = .black02
               $0.text = "Adidas"
               $0.font = .kreamFont(.body4(.heavy, isLh150: false))
            }
            
            view.addSubview(label)
            
            label.snp.makeConstraints {
               $0.centerX.centerY.equalToSuperview()
            }
         } else if idx == 4 {
            view.snp.makeConstraints {
               $0.height.equalTo(38)
               $0.width.equalTo(54)
            }
            
            let label = UILabel().then {
               $0.textColor = .black02
               $0.text = "Asics"
               $0.font = .kreamFont(.body4(.heavy, isLh150: false))
            }
            
            view.addSubview(label)
            
            label.snp.makeConstraints {
               $0.centerX.centerY.equalToSuperview()
            }
         } else if idx == 5 {
            view.snp.makeConstraints {
               $0.height.equalTo(38)
               $0.width.equalTo(100)
            }
            
            let label = UILabel().then {
               $0.textColor = .black02
               $0.text = "New Balance"
               $0.font = .kreamFont(.body4(.heavy, isLh150: false))
            }
            
            view.addSubview(label)
            
            label.snp.makeConstraints {
               $0.centerX.centerY.equalToSuperview()
            }
         }
         
         return view
      }
      .forEach(stackView.addArrangedSubview)
   }
   
   private func setUpStyle() {
      self.backgroundColor = .white
      
      stackView.do {
         $0.axis = .horizontal
         $0.distribution = .fill
         $0.spacing = 10
         $0.backgroundColor = .white
      }
   }
   
   private func setupViews() {
      self.snp.makeConstraints {
         $0.height.equalTo(57)
      }
      
      addSubview(stackView)
      
      stackView.snp.makeConstraints {
         $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
         $0.height.equalToSuperview()
      }
      
   }
   
   func addArrangedSubviews(_ views: [UIView]) {
      views.forEach { stackView.addArrangedSubview($0) }
   }
}
