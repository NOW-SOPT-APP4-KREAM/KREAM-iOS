//
//  LuckyDrawCollectionViewCell.swift
//  KREAM
//
//  Created by 박신영 on 5/24/24.
//

import UIKit

final class LuckyDrawCollectionViewCell: UICollectionViewCell {
   static let id = "LuckyDrawCollectionViewCell"
   
   let myView = UIImageView()
   var count = "0"
   
   private let rowStackView = UIStackView().then {
      $0.axis = .horizontal
      $0.spacing = 16
      $0.distribution = .fillEqually
   }
   
   private var timer: Timer?
   private var endDate: Date?
   
   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.contentView.addSubview(self.myView)
      
      myView.snp.makeConstraints {
         $0.edges.equalToSuperview()
      }
      
      myView.addSubview(rowStackView)
      
      rowStackView.snp.makeConstraints {
         $0.height.equalTo(41)
         $0.horizontalEdges.equalToSuperview().inset(90)
         $0.top.equalToSuperview().inset(40)
      }
      
      setupLabels()
      
      rowStackView.do {
         $0.isHidden = true
      }
      
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      timer?.invalidate()
      timer = nil
   }
   
   func setupLabels() {
      for _ in 0..<4 {
         let label = UILabel().then {
            $0.textColor = .black
            $0.textAlignment = .center
            $0.backgroundColor = .white
         }
         
         rowStackView.addArrangedSubview(label)
         label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
         }
         label.do {
            $0.font = .systemFont(ofSize: 28, weight: .heavy)
         }
      }
   }
   
   func startCountdown(toDate date: Date) {
      endDate = date
      timer?.invalidate()
      
      timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
         self?.updateLabels()
      }
      
      rowStackView.isHidden = false
   }
   
   private func updateLabels() {
      guard let endDate = endDate else { return }
      
      let calendar = Calendar.current
      let now = Date()
      let components = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: endDate)
      
      for (i, component) in [components.day, components.hour, components.minute, components.second].enumerated() {
         if let value = component, let label = rowStackView.arrangedSubviews[i] as? UILabel {
            label.text = String(format: "%02d", value)
            label.font = .systemFont(ofSize: 28, weight: .heavy)
         }
      }
      
      if now >= endDate {
         timer?.invalidate()
         timer = nil
      }
   }
   
   func configureCountdown() {
      let now = Date()
      let calendar = Calendar.current
      
      // 2일 13시간 8분 49초 후의 날짜와 시간을 계산
      if let endDate = calendar.date(byAdding: .day, value: 2, to: now)?
         .addingTimeInterval(13 * 3600)
         .addingTimeInterval(8 * 60)
         .addingTimeInterval(49) {
         startCountdown(toDate: endDate)
      }
   }
   
   func firstLuckyDraw() {
      rowStackView.isHidden = false
   }
}
