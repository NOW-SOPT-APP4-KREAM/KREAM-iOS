//
//  UIViewController.swift
//  KREAM
//
//  Created by 박신영 on 5/24/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

   private lazy var horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
       $0.scrollDirection = .horizontal
   }).then {
       $0.backgroundColor = .lightGray
       $0.showsHorizontalScrollIndicator = false
       $0.dataSource = self
       $0.delegate = self
       $0.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "HorizontalCell")
   }

   override func viewDidLoad() {
       super.viewDidLoad()
       
       setupViews()
   }
   
   private func setupViews() {
       view.addSubview(horizontalCollectionView)
       
       horizontalCollectionView.snp.makeConstraints { make in
           make.leading.trailing.equalToSuperview()
           make.height.equalTo(200)
           make.top.equalTo(view.safeAreaLayoutGuide)
       }
   }
}

extension ViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10 // 필요한 아이템 개수로 변경
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCell", for: indexPath) as! HorizontalCollectionViewCell
       cell.configure(with: indexPath.item)
       return cell
   }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 100, height: 180) // 아이템 크기 조절
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) // 컬렉션뷰 좌우 여백
   }
}

class HorizontalCollectionViewCell: UICollectionViewCell {
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       
       setupViews()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   private func setupViews() {
       contentView.backgroundColor = .white
       contentView.layer.cornerRadius = 8
   }
   
   func configure(with item: Int) {
       // 아이템 구성 로직
   }
}

#Preview {
   ViewController()
}
