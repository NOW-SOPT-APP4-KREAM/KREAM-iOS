//
//  ReleaseCollectionViewCell.swift
//  KREAM
//
//  Created by 박신영 on 5/23/24.
//

import UIKit
import SnapKit
import Then

protocol ItemCollectoinViewCellDelegate: AnyObject {
   func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ReleaseCollectionViewCell: UICollectionViewCell {
   
   static let identifier = "ItemCollectionViewCell"
   var itemRow: Int?
   
   weak var delegate: ItemCollectoinViewCellDelegate?
   
   private var updateChipState: Bool?
   private let itemImageView = UIImageView()
   private let brandTitle = UILabel()
   private let engTitle = UILabel()
   private let scrapBtn = UIButton()
   private let updateChip = UIView()
   private let newChip = UIView()
   private let chipLabel = UILabel()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      self.backgroundColor = .white
      setLayout()
      setStyle()
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      
      self.scrapBtn.isSelected = false
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
      
      brandTitle.do {
         $0.text = "BrandTitle"
         $0.font = .kreamFont(.custom(size: 13, weight: .heavy))
         $0.textColor = .black02
         $0.textAlignment = .left
         $0.numberOfLines = 1
      }
      
      engTitle.do {
         $0.text = "engTitle"
         $0.font = .kreamFont(.custom(size: 13, weight: .semibold))
         $0.textColor = .black02
         $0.textAlignment = .left
         $0.numberOfLines = 2
      }
      
      scrapBtn.do {
         $0.setImage(UIImage(resource: .icnScrap), for: .normal)
         $0.setImage(UIImage(resource: .icnScrapIsSelected), for: .selected)
      }
      
      updateChip.do {
         $0.backgroundColor = .white
         $0.layer.cornerRadius = 10
         $0.layer.borderColor = UIColor.gray03.cgColor
         $0.layer.borderWidth = 1
      }
      
      newChip.do {
         $0.backgroundColor = .red02
         $0.layer.cornerRadius = 10
         $0.layer.borderColor = UIColor.red02.cgColor
         $0.layer.borderWidth = 1
      }
      
      chipLabel.do {
         $0.font = .kreamFont(.body6(.semibold))
      }
   }
   
   func setLayout() {
      addSubviews(itemImageView, brandTitle, engTitle)
      
      itemImageView.snp.makeConstraints {
         $0.top.leading.trailing.equalToSuperview()
         $0.height.equalTo(101)
      }
      
      brandTitle.snp.makeConstraints {
         $0.top.equalTo(itemImageView.snp.bottom).offset(10)
         $0.leading.trailing.equalToSuperview()
      }
      
      engTitle.snp.makeConstraints {
         $0.top.equalTo(brandTitle.snp.bottom).offset(6)
         $0.leading.trailing.equalTo(brandTitle)
      }
      
      itemImageView.addSubview(scrapBtn)
      
      scrapBtn.snp.makeConstraints {
         $0.top.trailing.equalToSuperview().inset(10)
         $0.size.equalTo(24)
      }
   }
   
   func newOrUpdateChip() {
      if updateChipState == true {
         itemImageView.addSubviews(updateChip)
         updateChip.addSubview(chipLabel)
         
         updateChip.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(11)
            $0.width.equalTo(55)
            $0.height.equalTo(17)
         }
         
         chipLabel.do {
            $0.text = "UPDATE"
            $0.textColor = .black06
         }
         
         chipLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
         }
         
      } else if updateChipState == false {
         itemImageView.addSubviews(newChip)
         newChip.addSubview(chipLabel)
         
         newChip.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(11)
            $0.width.equalTo(36)
            $0.height.equalTo(17)
         }
         
         chipLabel.do {
            $0.text = "NEW"
            $0.textColor = .white
         }
         
         chipLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
         }
      }
   }
   
   @objc func heartButtonDidTap() {
      self.scrapBtn.isSelected.toggle()
      if let itemRow {
         self.delegate?.heartButtonDidTapEvent(
            state: self.scrapBtn.isSelected,
            row: itemRow
         )
      }
   }
}

extension ReleaseCollectionViewCell {
   func dataBind(_ itemData: ItemModel, itemRow: Int) {
      itemImageView.image = itemData.itemImg
      brandTitle.text = itemData.brandTitle
      engTitle.text =  itemData.engTitle
      scrapBtn.isSelected = itemData.isScrap
      updateChipState = itemData.isUpdate
      self.itemRow = itemRow
   }
}
