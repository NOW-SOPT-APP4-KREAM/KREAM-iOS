//
//  UnderlineSegmentedControl.swift
//  KREAM
//
//  Created by 박신영 on 5/23/24.
//

import UIKit
import SnapKit
import Then

final class UnderlineSegmentedControl: UISegmentedControl {
   
   // MARK: - UIComponent
   
   private lazy var underlineView: UIView = {
      let view = UIView()
      view.backgroundColor = .black
      addSubview(view)
      return view
   }()
   
   // MARK: - Initializer
   
   override init(items: [Any]?) {
      super.init(items: items)
      setUI()
      removeBackgroundAndDivider()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      let segmentFrames = segmentFrames()
      let labelFrames = segmentLabelFrames()
      
      guard selectedSegmentIndex < labelFrames.count,
            selectedSegmentIndex < segmentFrames.count
      else {
         return
      }
      
      let segmentFrame = segmentFrames[selectedSegmentIndex]
      
      let labelFrame = labelFrames[selectedSegmentIndex]
      
      UIView.animate(withDuration: 0.1) {
         self.underlineView.frame = CGRect(
            x: segmentFrame.minX + labelFrame.minX,
            y: self.bounds.height - 2.0,
            width: labelFrame.width,
            height: 4.0
         )
      }
   }
}

private extension UnderlineSegmentedControl {
   
   // MARK: - SetUI
   
   func setUI() {
      let attributes1 = [
         NSAttributedString.Key.foregroundColor: UIColor.black02,
         .font: UIFont.kreamFont(.body2(.semibold))
      ]
      let attributes2 = [
         NSAttributedString.Key.foregroundColor: UIColor.black01,
         .font: UIFont.kreamFont(.body2(.bold))
      ]
      
//      let specialAttribute = [
//         NSAttributedString.Key.foregroundColor: UIColor.brown,
//         .font: UIFont.kreamFont(.body2(.regular))
//      ]
      
      setTitleTextAttributes(attributes1, for: .normal)
      setTitleTextAttributes(attributes2, for: .selected)
      apportionsSegmentWidthsByContent = true
      selectedSegmentIndex = 0
      
   }
   
   func removeBackgroundAndDivider() {
      let image = UIImage()
      setBackgroundImage(image, for: .normal, barMetrics: .default)
      setBackgroundImage(image, for: .selected, barMetrics: .default)
      setBackgroundImage(image, for: .highlighted, barMetrics: .default)
      setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
   }
   
   func segmentLabelFrames() -> [CGRect] {
      subviews
         .sorted { $0.frame.minX < $1.frame.minX }
         .compactMap { $0.subviews.first(where: { $0 is UILabel }) as? UILabel }
         .map { $0.frame }
   }
   
   func segmentFrames() -> [CGRect] {
      let temp = subviews
         .sorted { $0.frame.minX < $1.frame.minX }
         .compactMap { $0 as? UIImageView }
         .map { $0.frame }
      
      var frames = [CGRect]()
      for i in 0..<temp.count {
         if i % 2 == 0 {
            frames.append(temp[i])
         }
      }
      return frames
   }
}
