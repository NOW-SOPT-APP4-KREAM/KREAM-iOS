//
//  HorizontalCell.swift
//  KREAM
//
//  Created by 박신영 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class HorizontalCell: UICollectionViewCell {
   
   static let identifier = "HorizontalCell"
   private let itemImageView = UIImageView()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.backgroundColor = .white
      setLayout()
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
   }
   
   @available(*, unavailable)
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   private func setStyle() {
      itemImageView.do {
         $0.backgroundColor = .blue03
         $0.layer.cornerRadius = 10
         $0.layer.borderColor = .none
      }
   }
   
   func setLayout() {
      addSubviews(itemImageView)
      
      itemImageView.snp.makeConstraints {
         $0.edges.equalToSuperview()
      }
   }
   
}
