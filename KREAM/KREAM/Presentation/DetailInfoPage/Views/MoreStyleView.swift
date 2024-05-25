//
//  MoreStyleView.swift
//  KREAM
//
//  Created by 송여경 on 5/25/24.
//

import UIKit
import Then
import SnapKit

class MoreStyleView : UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupStyle()
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Elements
    private let moreStyle = UIButton()
    
    //MARK: - SetUp
    private func setupStyle(){
        moreStyle.do {
            $0.setTitle("스타일 더보기", for: .normal)
            $0.setTitleColor(.black02, for: .normal)
            $0.titleLabel?.font = .kreamFont(.body4(.semibold, isLh150: true))
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.gray04.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        }
    }
    //MARK: - Layout
    private func setLayout(){
        addSubview(moreStyle)
    }
    private func setConstraints(){
        moreStyle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(40)
        }
    }
}
