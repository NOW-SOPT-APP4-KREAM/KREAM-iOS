//
//  SearchFilterTabsView.swift
//  KREAM
//
//  Created by 박민서 on 5/22/24.
//

import UIKit
import SnapKit
import Then

final class SearchFilterTabsView: UIView {
    
    // MARK: Properties

    // MARK: Views
    
    // MARK: Internal Logic
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpLayout()
        setUpStyle()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpViews
    private func setUpViews() {

    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [

        ].forEach { self.addSubview($0) }
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {

    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {

    }
}

// MARK: Internal Function
private extension SearchFilterTabsView {
    func applyButtonUI(to button: UIButton, leftImage: Bool = false, rightImage: Bool = false) {
        var configuration = UIButton.Configuration.filled()
        
        // 배경 UI 설정
        configuration.baseBackgroundColor = .clear
        configuration.background.strokeColor = .gray04
        configuration.background.strokeWidth = 1
        configuration.background.cornerRadius = 20
        configuration.contentInsets = .init(top: 7, leading: 11, bottom: 7, trailing: 11)
        
        // 글자 관련 설정
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.kreamFont(.body4(.semibold, isLh150: false))
            outgoing.foregroundColor = UIColor.black02
            return outgoing
        }
        configuration.titleLineBreakMode = .byTruncatingTail
        
        // 좌측 이미지
        if leftImage {
            let image = UIImage(systemName: "bolt")?.resized(to: .init(width: 14, height: 16))?.withRenderingMode(.alwaysTemplate)
            configuration.baseForegroundColor = .green02
            configuration.image = image
            configuration.imagePadding = 4
            configuration.imagePlacement = .leading
        }
        
        // 우측 이미지
        if rightImage {
            let image = UIImage(systemName: "chevron.down")?.resized(to: .init(width: 8, height: 4))?.withRenderingMode(.alwaysTemplate)
            configuration.baseForegroundColor = .gray03
            configuration.image = image
            configuration.imagePadding = 4
            configuration.imagePlacement = .trailing
        }
        
        button.configuration = configuration
    }
}

#Preview {
//    PreviewController(SearchFilterTabsView(), snp: { view in
//        view.snp.makeConstraints {
//            $0.width.equalTo(120)
//            $0.height.equalTo(60)
//            $0.center.equalToSuperview()
//        }
//    })
    SearchFilterTabsView()
}
