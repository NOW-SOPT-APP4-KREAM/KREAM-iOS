//
//  ItemInfoStickyView.swift
//  KREAM
//
//  Created by 송여경 on 5/21/24.
//

import UIKit
import Then
import SnapKit

class ItemInfoStickyView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpStyle()
        setLayout()
        setConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrapImageView = UIImageView()
    
    private let numberLabel = UILabel()
    
    private let purchaseLabelView = UIView()
    
    private let sellLabelView = UIView()
    
    private let purchaseLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    private let purchasesubLabel = UILabel()
    
    private let sellLabel = UILabel()
    
    private let priceSellLabel = UILabel()
    
    private let sellSubLabel = UILabel()
    
    private let purchaseSegmentView = UIView()
    
    private let sellSegmentView = UIView()
    
    //MARK: - SetUp
    func setUpStyle() {
        purchaseLabelView.do {
            $0.backgroundColor = .red02
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        sellLabelView.do {
            $0.backgroundColor = .green03
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        numberLabel.do {
            $0.attributedText = "11.4만".toKreamFontString(.custom(size: 11, weight: .semibold))
            $0.textColor = .black
        }
        scrapImageView.do {
            $0.image = UIImage(named: "icn_scrap")
        }
        purchaseLabel.do {
            $0.attributedText = "구매".toKreamFontString(.custom(size: 16, weight: .bold))
            $0.textColor = .white
        }
        priceLabel.do {
            $0.attributedText = "129,000".toKreamFontString(.custom(size: 13, weight: .heavy))
            $0.textColor = .white
        }
        purchasesubLabel.do {
            $0.attributedText = "즉시 구매가".toKreamFontString(.custom(size: 11, weight: .bold))
            $0.textColor = .red03
        }
        sellLabel.do {
            $0.attributedText = "판매".toKreamFontString(.custom(size: 16, weight: .bold))
            $0.textColor = .white
        }
        priceSellLabel.do {
            $0.attributedText = "148,000".toKreamFontString(.custom(size: 13, weight: .heavy))
            $0.textColor = .white
        }
        sellSubLabel.do {
            $0.attributedText = "즉시 판매가".toKreamFontString(.custom(size: 11, weight: .bold))
            $0.textColor = .green04
        }
        purchaseSegmentView.do {
            $0.backgroundColor = .red04
        }
        sellSegmentView.do {
            $0.backgroundColor = .green06
        }
        
    }
    
    //MARK: - Layout
    private func setLayout() {
        [purchaseLabelView, sellLabelView, numberLabel, scrapImageView, purchaseLabel, purchaseSegmentView, priceLabel, purchasesubLabel, sellLabel, sellSegmentView,priceSellLabel, sellSubLabel].forEach {
            self.addSubview($0)
        }
    }
    
    private func setConstraints() {
        
        scrapImageView.snp.makeConstraints {
//            $0.bottom.equalToSuperview().inset(60.5)
            $0.top.equalToSuperview().offset(17.5)
            $0.leading.equalToSuperview().offset(26.5)
            $0.width.equalTo(16)
            $0.height.equalTo(17)
        }
        
        numberLabel.snp.makeConstraints {
            $0.top.equalTo(scrapImageView.snp.bottom).offset(3.5)
            $0.centerX.equalTo(scrapImageView)
        }
    
        purchaseLabelView.snp.makeConstraints {
//            $0.bottom.equalToSuperview().inset(38)
            $0.top.equalToSuperview().offset(8)
//            $0.leading.equalToSuperview().offset(67)
            $0.leading.equalTo(numberLabel.snp.trailing).offset(16)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        purchaseLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseLabelView.snp.top).offset(15)
            $0.leading.equalTo(purchaseLabelView.snp.leading).offset(10)
        }
        
        purchaseSegmentView.snp.makeConstraints{
            $0.leading.equalTo(purchaseLabelView.snp.leading).offset(48)
            $0.top.bottom.equalTo(purchaseLabelView)
            $0.width.equalTo(2)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(purchaseLabelView.snp.top).offset(9)
            $0.leading.equalTo(purchaseSegmentView.snp.trailing).offset(9)
        }
        
        purchasesubLabel.snp.makeConstraints {
            $0.bottom.equalTo(purchaseLabelView.snp.bottom).offset(-9)
            $0.leading.equalTo(purchaseSegmentView.snp.trailing).offset(9)
        }
        
        sellLabelView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
//            $0.bottom.equalToSuperview().inset(38)
            $0.leading.equalTo(purchaseLabelView.snp.trailing).offset(6)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        sellLabel.snp.makeConstraints {
            $0.top.equalTo(sellLabelView.snp.top).offset(15)
            $0.leading.equalTo(sellLabelView.snp.leading).offset(10)
        }
        
        sellSegmentView.snp.makeConstraints{
            $0.top.bottom.equalTo(purchaseLabelView)
            $0.leading.equalTo(sellLabelView.snp.leading).offset(48)
            $0.width.equalTo(2)
        }
        
        priceSellLabel.snp.makeConstraints {
            $0.top.equalTo(sellLabelView.snp.top).offset(9)
            $0.leading.equalTo(sellSegmentView.snp.trailing).offset(9)
        }
        
        sellSubLabel.snp.makeConstraints {
            $0.bottom.equalTo(sellLabelView.snp.bottom).offset(-9)
            $0.leading.equalTo(sellSegmentView.snp.trailing).offset(9)
        }
    }
    //MARK: - Configure
        func configureScrapCount(_ scrapCount: String) {
            numberLabel.attributedText = scrapCount.toKreamFontString(.custom(size: 11, weight: .semibold))
            numberLabel.textColor = .black // 이 부분에서 색상을 조정합니다.
        }
        
        func configureCellPrice(_ cellPrice: String) {
            priceSellLabel.attributedText = cellPrice.toKreamFontString(.custom(size: 13, weight: .heavy))
            priceSellLabel.textColor = .white
        }
        
        func configure(scrapCount: String, cellPrice: String) {
            configureScrapCount(scrapCount)
            configureCellPrice(cellPrice)
        }
}
