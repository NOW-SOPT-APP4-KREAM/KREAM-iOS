//
//  StyleTopView.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit
import Then

class StyleTopView : UIView {
    //MARK: - Set Elements
    private let topStyleBar = UIView()
    private let styleNumber = UILabel()
    private let stylePlusBtn = UIButton()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetUp
    private func setupStyle(){
        topStyleBar.do{
            $0.backgroundColor = .white
        }
        styleNumber.do{
            let attributedString = NSMutableAttributedString(string: "스타일 ", attributes: [
                NSAttributedString.Key.font: UIFont.kreamFont(.custom(size: 16, weight: .bold)),
                NSAttributedString.Key.foregroundColor: UIColor.black02
            ])
            attributedString.append("1,346".toKreamFontString(.custom(size: 17, weight: .heavy)))
            $0.attributedText = attributedString
        }
        stylePlusBtn.do{
            $0.setTitle("+ 스타일 올리기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .kreamFont(.body6(.semibold))
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 8
        }
    }
    
    //MARK: - Layout
    private func setLayout(){
        [topStyleBar, styleNumber, stylePlusBtn].forEach {
            self.addSubview($0)
        }
    }
    
    private func setConstraints(){
        topStyleBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(61)
        }
        styleNumber.snp.makeConstraints {
            $0.top.equalTo(topStyleBar.snp.top).offset(24.5)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
        stylePlusBtn.snp.makeConstraints {
            $0.top.equalTo(topStyleBar.snp.top).offset(20)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(88)
            $0.height.equalTo(29)
        }
    }
    //MARK: Configure
    func configureStyleCount(_ count: String) {
            let attributedString = NSMutableAttributedString(string: "스타일 ", attributes: [
                NSAttributedString.Key.font: UIFont.kreamFont(.custom(size: 16, weight: .bold)),
                NSAttributedString.Key.foregroundColor: UIColor.black02
            ])
            attributedString.append(count.toKreamFontString(.custom(size: 17, weight: .heavy)))
            styleNumber.attributedText = attributedString
        }
}
