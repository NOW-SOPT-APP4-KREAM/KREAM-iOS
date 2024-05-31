//
//  ProductBenefitView.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import Then
import SnapKit

class ProductBenefitView : UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setLayout()
        setUpStyle()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Set Elements
    private let benefitLabel = UILabel()
    private let moreView = UILabel()
    private let point = UILabel()
    private let pointSentence = UILabel()
    private let payment = UILabel()
    private let paymentSentence = UILabel()
    
    //MARK: - Setup
    func setUpStyle(){
        benefitLabel.do {
            $0.attributedText = "추가 구매".toKreamFontString(.custom(size: 13, weight: .bold))
            $0.textColor = .black02
        }
        moreView.do {
            $0.attributedText = "더보기".toKreamFontString(.custom(size: 13, weight: .bold))
            $0.textColor = .black06
        }
        point.do{
            $0.attributedText = "포인트".toKreamFontString(.custom(size: 12, weight: .bold))
            $0.textColor = .black06
        }
        pointSentence.do {
            let fullText = "계좌 간편 결제 시1%적립"
            let highlightedText = "1%"
            let fullRange = (fullText as NSString).range(of: fullText)
            let highlightedRange = (fullText as NSString).range(of: highlightedText)
            
            let attributedString = NSMutableAttributedString(string: fullText)
            attributedString.addAttributes([
                .font: UIFont.kreamFont(.custom(size: 13, weight: .bold)),
                .foregroundColor: UIColor.black02
            ], range: fullRange)
            attributedString.addAttributes([
                .font: UIFont.systemFont(ofSize: 13, weight: .black)
            ], range: highlightedRange)
            
            $0.attributedText = attributedString
        }
        payment.do {
            $0.attributedText = "결제".toKreamFontString(.custom(size: 12, weight: .semibold))
            $0.textColor = .black06
        }
        paymentSentence.do {
            let fullText = "계좌간편결제 최대 5만 포인트 적립 & 수수료 할인 외 7건"
            let highlightedText = "외 7건"
            let fullRange = (fullText as NSString).range(of: fullText)
            let highlightedRange = (fullText as NSString).range(of: highlightedText)
            
            let attributedString = NSMutableAttributedString(string: fullText)
            attributedString.addAttributes([
                .font: UIFont.systemFont(ofSize: 13, weight: .bold),
                .foregroundColor: UIColor.black02
            ], range: fullRange)
            attributedString.addAttributes([
                .foregroundColor: UIColor.black06
            ], range: highlightedRange)
            
            $0.attributedText = attributedString
        }
    }
    //MARK: - Layout
    private func setLayout(){
        [benefitLabel, moreView, point, pointSentence, payment, paymentSentence].forEach{
            self.addSubviews($0)
        }
    }
    
    private func setConstraints(){
        benefitLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(49)
            $0.height.equalTo(16)
        }
        moreView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(34)
            $0.height.equalTo(16)
        }
        point.snp.makeConstraints {
            $0.top.equalTo(benefitLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(32)
            $0.height.equalTo(14)
        }
        pointSentence.snp.makeConstraints {
            $0.top.equalToSuperview().inset(48)
            $0.leading.equalTo(point.snp.trailing).offset(20)
            $0.width.equalTo(150)
            $0.height.equalTo(14)
        }
        payment.snp.makeConstraints {
            $0.top.equalTo(point.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(32)
            $0.height.equalTo(14)
        }
        paymentSentence.snp.makeConstraints {
            $0.top.equalTo(pointSentence.snp.bottom).offset(8)
            $0.leading.equalTo(payment.snp.trailing).offset(20)
            $0.width.equalTo(300)
            $0.height.equalTo(14)
        }
        
    }
}
