//
//  LuckyDrawCollectionViewController.swift
//  KREAM
//
//  Created by 박신영 on 5/24/24.
//

import UIKit

#Preview {
   LuckyDrawCollectionViewController()
}

class LuckyDrawCollectionViewController: UIViewController {
   
   private enum Const {
      static let itemSize = CGSize(width: 400, height: 337)
      static let itemSpacing = 0.0
   }
   var cnt = 0
   
   private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.itemSize = Const.itemSize
      layout.minimumLineSpacing = Const.itemSpacing
      layout.minimumInteritemSpacing = 0
      return layout
   }()
   private lazy var collectionView: UICollectionView = {
      let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
      view.isScrollEnabled = true
      view.showsHorizontalScrollIndicator = false
      view.showsVerticalScrollIndicator = true
      view.backgroundColor = .clear
      view.clipsToBounds = true
      view.register(LuckyDrawCollectionViewCell.self, forCellWithReuseIdentifier: LuckyDrawCollectionViewCell.id)
      view.isPagingEnabled = false // <- 한 페이지의 넓이를 조절 할 수 없기 때문에 scrollViewWillEndDragging을 사용하여 구현
      view.contentInsetAdjustmentBehavior = .never // <- 내부적으로 safe area에 의해 가려지는 것을 방지하기 위해서 자동으로 inset조정해 주는 것을 비활성화
      //      view.contentInset = Const.collectionViewContentInset // <-
      view.decelerationRate = .fast // <- 스크롤이 빠르게 되도록 (페이징 애니메이션같이 보이게하기 위함)
      return view
   }()
   
   private var items = [
      UIImage(resource: .luckyDraw1),
      UIImage(resource: .luckyDraw2),
      UIImage(resource: .luckyDraw3),
      UIImage(resource: .luckyDraw4)
   ]
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.view.addSubview(self.collectionView)
      collectionView.snp.makeConstraints {
         $0.edges.equalToSuperview()
      }
      
      self.collectionView.dataSource = self
      self.collectionView.delegate = self
   }
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      
      let contentWidth = Const.itemSize.width * CGFloat(items.count)
      collectionView.contentSize = CGSize(width: contentWidth, height: Const.itemSize.height)
   }
   
}

extension LuckyDrawCollectionViewController: UICollectionViewDelegateFlowLayout {
   func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      let scrolledOffsetX = targetContentOffset.pointee.x
      let cellWidth = Const.itemSize.width + Const.itemSpacing
      let index = round(scrolledOffsetX / cellWidth)
      targetContentOffset.pointee = CGPoint(x: index * cellWidth, y: 0)
   }
}

extension LuckyDrawCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      4
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(
         withReuseIdentifier: LuckyDrawCollectionViewCell.id,
         for: indexPath
      ) as? LuckyDrawCollectionViewCell else {
         return UICollectionViewCell()
      }
      
      cell.myView.image = items[indexPath.row]
      
      // 첫 번째 인덱스일 때만 firstLuckyDraw(), configureCountdown 호출
      if indexPath.row == 0 {
         cell.firstLuckyDraw()
         cell.configureCountdown()
      }
      
      return cell
   }
}
