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
    
    //MARK: -SetUp
    func setUpStyle() {
        purchaseLabelView.do {
            $0.backgroundColor = .red04
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        sellLabelView.do {
            $0.backgroundColor = .green06
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        numberLabel.do {
            $0.attributedText = "11.4만".toKreamFontString(.custom(size: 11, weight: .semibold))
            $0.textColor = .black
        }
        scrapImageView.do {
            $0.image = UIImage(named: "scrap")
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
        
    }
    
    //MARK: - Layout
    private func setLayout() {
        [purchaseLabelView, sellLabelView, numberLabel, scrapImageView, purchaseLabel, priceLabel, purchasesubLabel, sellLabel, priceSellLabel, sellLabel].forEach{
            self.addSubview($0)
        }
        
        purchaseLabelView.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().offset(67)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        sellLabelView.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().offset(-8)
            $0.width.equalTo(147)
            $0.height.equalTo(49)
        }
        
        numberLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(18)
            $0.width.equalTo(33)
            $0.height.equalTo(13)
        }
        
        scrapImageView.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().offset(22.5)
            $0.width.height.equalTo(24)
        }
        
        purchaseLabel.snp.makeConstraints{
            $0.top.equalTo(purchaseLabelView.snp.top).offset(15)
            $0.leading.equalTo(purchaseLabelView.snp.leading).offset(10)
            $0.width.equalTo(28)
            $0.width.equalTo(19)
        }
        
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(purchaseLabelView.snp.top).offset(9)
            $0.trailing.equalTo(purchaseLabelView.snp.trailing).offset(-39)
            $0.width.equalTo(49)
            $0.width.equalTo(16)
        }
        
        purchasesubLabel.snp.makeConstraints{
            $0.bottom.equalTo(purchaseLabelView.snp.bottom).offset(9)
            $0.trailing.equalTo(purchaseLabelView.snp.trailing).offset(-37)
            $0.width.equalTo(51)
            $0.width.equalTo(13)
        }
        
        sellLabel.snp.makeConstraints{
            $0.top.equalTo(sellLabelView.snp.top).offset(15)
            $0.leading.equalTo(sellLabelView.snp.leading).offset(10)
            $0.width.equalTo(28)
            $0.width.equalTo(19)
        }
        
        priceSellLabel.snp.makeConstraints{
            $0.top.equalTo(sellLabelView.snp.top).offset(9)
            $0.trailing.equalTo(sellLabelView.snp.trailing).offset(-38)
            $0.width.equalTo(50)
            $0.width.equalTo(16)
        }
        
        sellLabel.snp.makeConstraints{
            $0.bottom.equalTo(sellLabelView.snp.bottom).offset(9)
            $0.trailing.equalTo(sellLabelView.snp.trailing).offset(-37)
            $0.width.equalTo(50)
            $0.width.equalTo(13)
        }
    }
    
}

#Preview {
    ItemInfoStickyView()
}
