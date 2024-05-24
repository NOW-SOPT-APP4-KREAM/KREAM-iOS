//
//  DeliveryInfoView.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit
import Then

class DeliveryInfoView : UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setLayout()
        setUpStyle()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Set Elements
    private let deliInfoLabel = UILabel()
    private let speedDeliyImg = UIImageView()
    private let speedDeliLabel = UILabel()
    private let speedDeliSub = UILabel()
    private let normalDeliImg = UIImageView()
    private let normalDeliLabel = UILabel()
    private let normalDeliSub = UILabel()
    private let storageDeliImg = UIImageView()
    private let storageDeliLabel = UILabel()
    private let storageDeliSub = UILabel()
    private let speedQImg = UIImageView()
    private let storageQImg = UIImageView()
    
    //MARK: SetUp
    func setUpStyle(){
        deliInfoLabel.do {
            $0.attributedText = "배송 정보".toKreamFontString(.custom(size: 13, weight: .bold))
            $0.textColor = .black
        }
        speedDeliyImg.do {
            $0.image = UIImage(named: "icn_deliver")
        }
        speedDeliLabel.do {
            $0.attributedText = "빠른배송 5,000원".toKreamFontString(.custom(size: 13, weight: .bold))
            $0.textColor = .black02
        }
        speedDeliSub.do {
            let fullText = "지금 결제시 내일 4/24(수) 도착 예정"
            let nowText = "내일"
            let tomorrowText = "도착 예정"
            let dateText = "4/24(수)"
            
            let fullRange = (fullText as NSString).range(of: fullText)
            let nowRange = (fullText as NSString).range(of: nowText)
            let tomorrowRange = (fullText as NSString).range(of: tomorrowText)
            let dateRange = (fullText as NSString).range(of: dateText)
            
            let attributedString = NSMutableAttributedString(string: fullText)
            attributedString.addAttributes([
                .font: UIFont.systemFont(ofSize: 13, weight: .regular),
                .foregroundColor: UIColor.black
            ], range: fullRange)
            
            attributedString.addAttributes([
                .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                .foregroundColor: UIColor.blue01
            ], range: nowRange)
            
            attributedString.addAttributes([
                .font: UIFont.systemFont(ofSize: 13, weight: .semibold),
                .foregroundColor: UIColor.blue01
            ], range: tomorrowRange)
            
            attributedString.addAttributes([
                .font: UIFont.systemFont(ofSize: 13, weight: .heavy),
                .foregroundColor: UIColor.blue01
            ], range: dateRange)
            
            $0.attributedText = attributedString
        }
        normalDeliImg.do {
            $0.image = UIImage(named: "icn_normaldeliver")
        }
        normalDeliLabel.do {
            $0.attributedText = "일반배송 3,000원".toKreamFontString(.custom(size: 13, weight: .bold))
            $0.textColor = .black02
        }
        normalDeliSub.do {
            $0.attributedText = "검수 후 배송 ・ 5-7일 내 도착 예정".toKreamFontString(.custom(size: 13, weight: .semibold))
            $0.textColor = .black06
        }
        storageDeliImg.do {
            $0.image = UIImage(named: "icn_storage")
        }
        storageDeliLabel.do {
            $0.attributedText = "창고보관 첫 30일 무료".toKreamFontString(.custom(size: 13, weight: .bold))
            $0.textColor = .black02
        }
        storageDeliSub.do{
            $0.attributedText = "배송 없이 창고에 보관 ・ 5빠르게 판매 가능".toKreamFontString(.custom(size: 13, weight: .semibold))
            $0.textColor = .black06
        }
        speedQImg.do {
            $0.image = UIImage(named: "icn_question")
        }
        storageQImg.do {
            $0.image = UIImage(named: "icn_question")
        }
    }
    //MARK: Layout
    private func setLayout(){
        [speedQImg, deliInfoLabel, speedDeliLabel, speedDeliyImg, speedDeliSub, normalDeliImg, normalDeliLabel, normalDeliSub, storageDeliImg, storageDeliLabel, storageDeliSub, storageQImg].forEach{
            self.addSubviews($0)
        }
    }
    private func setConstraints(){
        deliInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(49)
            $0.height.equalTo(16)
        }
        speedDeliyImg.snp.makeConstraints {
            $0.top.equalTo(deliInfoLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(38)
        }
        speedDeliLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(49)
            $0.leading.equalTo(speedDeliyImg.snp.trailing).offset(15)
            $0.width.equalTo(95)
            $0.height.equalTo(20)
        }
        speedQImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(49)
            $0.leading.equalTo(speedDeliLabel.snp.trailing).offset(2)
            $0.width.height.equalTo(16)
        }
        speedDeliSub.snp.makeConstraints{
            $0.top.equalTo(speedDeliLabel.snp.bottom)
            $0.leading.equalTo(speedDeliyImg.snp.trailing).offset(15)
            $0.width.equalTo(200)
            $0.height.equalTo(16)
        }
        normalDeliImg.snp.makeConstraints {
            $0.top.equalTo(speedDeliyImg.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(38)
        }
        normalDeliLabel.snp.makeConstraints {
            $0.top.equalTo(speedDeliSub.snp.bottom).offset(12)
            $0.leading.equalTo(normalDeliImg.snp.trailing).offset(15)
            $0.width.equalTo(95)
            $0.height.equalTo(20)
        }
        normalDeliSub.snp.makeConstraints {
            $0.top.equalTo(normalDeliLabel.snp.bottom)
            $0.leading.equalTo(normalDeliImg.snp.trailing).offset(15)
            $0.width.equalTo(200)
            $0.height.equalTo(16)
        }
        storageDeliImg.snp.makeConstraints{
            $0.top.equalTo(normalDeliImg.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(38)
        }
        storageDeliLabel.snp.makeConstraints{
            $0.top.equalTo(normalDeliSub.snp.bottom).offset(13)
            $0.leading.equalTo(normalDeliImg.snp.trailing).offset(15)
            $0.width.equalTo(116)
            $0.height.equalTo(20)
        }
        storageQImg.snp.makeConstraints {
            $0.top.equalTo(normalDeliSub.snp.bottom).offset(12)
            $0.leading.equalTo(storageDeliLabel.snp.trailing).offset(2)
            $0.width.height.equalTo(16)
        }
        storageDeliSub.snp.makeConstraints{
            $0.top.equalTo(storageDeliLabel.snp.bottom)
            $0.leading.equalTo(storageDeliImg.snp.trailing).offset(15)
            $0.width.equalTo(215)
            $0.height.equalTo(16)
        }
    }
}
