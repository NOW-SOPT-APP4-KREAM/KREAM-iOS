//
//  TabView.swift
//  KREAM
//
//  Created by 박신영 on 5/24/24.
//

import UIKit
import Then
import SnapKit

final class TabView: UIView {
   
   private let stackView = UIStackView().then {
      $0.spacing = 27
      $0.axis = .horizontal
   }
   private let tabScrollView = UIScrollView().then {
      $0.showsHorizontalScrollIndicator = false
   }
   let highlightView = UIView().then {
      $0.backgroundColor = .gray
   }
   private var contentLabels = [UILabel]()
   
   // MARK: Property
   var dataSource: [String]? {
      didSet { setItems() }
   }
   var didTap: ((Int) -> Void)?
   
   // MARK: Initializer
   required init() {
      super.init(frame: .zero)
      configure()
   }
   required init?(coder: NSCoder) {
      fatalError()
   }
   
   private func configure() {
      addSubview(tabScrollView)
      tabScrollView.addSubviews(stackView, highlightView)
      
      tabScrollView.snp.makeConstraints {
         $0.edges.equalToSuperview()
      }
      
      stackView.snp.makeConstraints {
         $0.top.bottom.height.equalToSuperview()
         $0.horizontalEdges.equalTo(tabScrollView.contentLayoutGuide).inset(5)
         
      }
      
      highlightView.snp.remakeConstraints {
         $0.width.equalTo(0)
         $0.height.equalTo(4)
         $0.leading.equalToSuperview()
         $0.bottom.equalToSuperview()
      }
   }
   
   private func setItems() {
      guard let items = dataSource else { return }
      items
         .enumerated()
         .forEach { offset, item in
            let label = UILabel().then {
               $0.text = item
               $0.numberOfLines = 0
               $0.font = .kreamFont(.custom(size: 15, weight: .semibold))
               $0.textColor = .black02
               $0.textAlignment = .center
               $0.isUserInteractionEnabled = true
               $0.tag = offset
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapItem))
               $0.addGestureRecognizer(tapGesture)
            }
            if label.text == "시즌오프" {
               label.textColor = .brown
            }
            self.stackView.addArrangedSubview(label)
            self.contentLabels.append(label)
         }
   }
   
   @objc private func tapItem(sender: UITapGestureRecognizer) {
      guard let selectedLabel = sender.view as? UILabel,
            let selectedIndex = contentLabels.firstIndex(of: selectedLabel)
      else { return }
      
      contentLabels.forEach {
         $0.font = .kreamFont(.custom(size: 15, weight: .semibold))
      }
      
      selectedLabel.font = .kreamFont(.custom(size: 15, weight: .bold))
      
      didTap?(selectedIndex)
      
      guard let tag = sender.view?.tag else { return }
      didTap?(tag)
   }
   
}

extension TabView: ScrollFitable {
   var tabContentViews: [UIView] {
      contentLabels
   }
   
   var scrollView: UIScrollView {
      tabScrollView
   }
   var countOfItems: Int {
      dataSource?.count ?? 0
   }
}
