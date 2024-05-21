//
//  ReleaseInfoPageViewController.swift
//  KREAM
//
//  Created by 박신영 on 5/21/24.
//

import UIKit

import SnapKit
import Then

class ReleaseInfoPageViewController: UIViewController {
   
   let customNavigationView = CustomNavigationView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setUpViews()
      setUpStyle()
      setUpLayout()
      setUpConstraint()
   }
   
   // MARK: setUpViews
   private func setUpViews() {
      
   }
   
   // MARK: setUpLayout
   private func setUpLayout() {
      self.view.addSubview(customNavigationView)
   }
   
   // MARK: setUpStyle
   private func setUpStyle() {
      self.navigationController?.navigationBar.isHidden = true
      self.view.backgroundColor = .white
   }
   
   // MARK: setUpConstraint
   private func setUpConstraint() {
      customNavigationView.snp.makeConstraints {
         $0.top.equalTo(view.safeAreaLayoutGuide)
         $0.horizontalEdges.equalToSuperview()
      }
   }
   
}

#Preview {
   ReleaseInfoPageViewController()
}
