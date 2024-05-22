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
