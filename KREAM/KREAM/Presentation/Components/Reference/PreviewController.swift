//
//  PreviewController.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit
import SnapKit

/// 컴포넌트를 실제 VC에서 snp 적용했을 때 표시되는 내용을 확인하는 ViewController입니다.
/// - parameter view : 컴포넌트 View()
/// - parameter setupSnp: 해당 컴포넌트에 적용하는 snp 로직
final class PreviewController: UIViewController {
    
    private let presentation: UIView
    private var setupSnp: ((UIView) -> Void)?
        
    init(_ view: UIView, snp: @escaping (UIView) -> Void) {
        self.presentation = view
        self.setupSnp = snp
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(presentation)
        setupSnp?(presentation)
    }
}

// MARK: 사용 예시
#Preview {
    PreviewController(SearchSegmentControlView(), snp: { view in
        view.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    })
}
