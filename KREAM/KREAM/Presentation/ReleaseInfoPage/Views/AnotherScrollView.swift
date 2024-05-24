//
//  AnotherScrollView.swift
//  KREAM
//
//  Created by 박신영 on 5/24/24.
//

import UIKit
import SnapKit
import Then

class AnotherScrollView: UIScrollView {
   
   private var contentView = UIView()
   private var greenView = UIView().then {
      $0.backgroundColor = .green
   }
   private var blueView = UIView().then {
      $0.backgroundColor = .blue
   }
   private var redView = UIView().then {
      $0.backgroundColor = .red
   }
   private var orangeView = UIView().then {
      $0.backgroundColor = .orange
   }
   private var yellowView = UIView().then {
      $0.backgroundColor = .yellow
   }
   private var purpleView = UIView().then {
      $0.backgroundColor = .purple
   }
   
   private lazy var colors = [redView, orangeView, yellowView, greenView, blueView, purpleView]
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      setLayout()
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
   }

   private func setLayout() {
      
      let width = UIScreen.main.bounds.width
      let height = 337
         addSubview(contentView)
      
      colors.forEach {
         contentView.addSubview($0)
      }
      
      contentView.snp.makeConstraints {
         $0.edges.width.equalToSuperview()
         $0.height.greaterThanOrEqualToSuperview().priority(.low)
      }
      
      redView.snp.makeConstraints {
         $0.top.equalToSuperview().offset(-30)
         $0.leading.equalToSuperview()
         $0.width.equalTo(width/2)
         $0.height.equalTo(height)
      }
      
      orangeView.snp.makeConstraints {
         $0.top.equalTo(redView.snp.top)
         $0.leading.equalTo(redView.snp.trailing)
         $0.width.height.equalTo(redView)
      }
      
      yellowView.snp.makeConstraints {
         $0.top.equalTo(redView.snp.bottom)
         $0.leading.equalToSuperview()
         $0.width.height.equalTo(redView)
      }
      
      greenView.snp.makeConstraints {
         $0.top.equalTo(yellowView)
         $0.leading.equalTo(yellowView.snp.trailing)
         $0.width.height.equalTo(redView)
      }
      
      blueView.snp.makeConstraints {
         $0.top.equalTo(yellowView.snp.bottom)
         $0.leading.equalToSuperview()
         $0.width.height.equalTo(redView)
         $0.bottom.equalTo(contentView)
      }
      
      purpleView.snp.makeConstraints {
         $0.top.equalTo(blueView)
         $0.leading.equalTo(blueView.snp.trailing)
         $0.width.height.equalTo(redView)
         $0.bottom.equalTo(blueView)
      }
   }

}
