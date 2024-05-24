//
//  ReleaseCollectionViewController.swift
//  KREAM
//
//  Created by 박신영 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class ReleaseCollectionViewController: UIViewController {
   
   final let lineSpacing: CGFloat = 20
   final let interItemSpacing: CGFloat = 7
   final let cellHeight: CGFloat = 165
   final let inset = UIEdgeInsets(top: 0, left: 16, bottom: 14, right: 16)
   
   private var itemData = ItemModel.dummy() {
      didSet {
         self.collectionView.reloadData()
      }
   }
   
   let collectionView : UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.itemSize = .init(width: 168, height: 165)
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      return collectionView
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = .white
      setLayout()
      register()
      setDelegate()
   }
   
   private func setLayout() {
      self.view.addSubview(collectionView)
      self.view.snp.makeConstraints {
//         $0.width.equalTo(375)
         $0.height.equalTo(1090)
      }
      
      collectionView.snp.makeConstraints {
         $0.edges.equalToSuperview()
      }
   }
   
   private func register() {
      collectionView.register(
         ReleaseCollectionViewCell.self,
         forCellWithReuseIdentifier: ReleaseCollectionViewCell.identifier
      )
   }
   
   private func setDelegate() {
      collectionView.delegate = self
      collectionView.dataSource = self
   }
   
   private func calculateCellHeight() -> CGFloat {
      let count = CGFloat(itemData.count)
      let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
      return heightCount * cellHeight + (heightCount - 1) * lineSpacing + inset.top + inset.bottom
   }
}

extension ReleaseCollectionViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath
   ) -> CGSize {
      return CGSize(width: 168, height: 165)
   }
   
   func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      minimumLineSpacingForSectionAt section: Int
   ) -> CGFloat {
      return lineSpacing
   }
   
   func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      minimumInteritemSpacingForSectionAt section: Int
   ) -> CGFloat {
      return interItemSpacing
   }
   
   func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      insetForSectionAt section: Int
   ) -> UIEdgeInsets {
      return inset
   }
}

extension ReleaseCollectionViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return itemData.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(
         withReuseIdentifier: ReleaseCollectionViewCell.identifier,
         for: indexPath
      ) as? ReleaseCollectionViewCell else { return UICollectionViewCell() }
      cell.delegate = self
      cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
      cell.newOrUpdateChip()
      return cell
   }
}

extension ReleaseCollectionViewController: ItemCollectoinViewCellDelegate {
   func heartButtonDidTapEvent(state: Bool, row: Int) {
      itemData[row].isScrap = state
   }
}
