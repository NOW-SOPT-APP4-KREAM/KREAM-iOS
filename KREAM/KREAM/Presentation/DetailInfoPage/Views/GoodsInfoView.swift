//
//  GoodsInfoView.swift
//  KREAM
//
//  Created by 송여경 on 5/23/24.
//

import UIKit
import SnapKit
import Then

class GoodsInfoView : UIView{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpStyle()
        setLayout()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Elements
    
//    let collectionView: UICollectionView = {
//        let flowlayout = UICollectionViewLayout()
//        let cv = UICollectionView(frame: <#T##CGRect#>)
//        return cv
//    }()
    
    private let priceSubLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    private let productNameEng = UILabel()
    
    private let productNameKor = UILabel()
    
    private let buttonBound = UIView()
    
    private let buttonLabel = UILabel()
    
    private let downArrow = UIImageView()
    
    //MARK: - SetUp
    func setUpStyle() {
        priceSubLabel.do {
            $0.attributedText = "즉시 구매가".toKreamFontString(.custom(size: 12, weight: .semibold))
            $0.textColor = .black02
        }
        priceLabel.do{
            $0.text = "0원"
            $0.font = .kreamFont(.custom(size: 19, weight: .heavy))
            $0.textColor = .black02
        }
        productNameEng.do {
            $0.text = "Adidas Samba OG Cloud White"
            $0.font = .kreamFont(.custom(size: 16, weight: .bold))
            $0.textColor = .black02
        }
        productNameKor.do {
            $0.text = "아디다스 삼바 OG 클라우드 화이트"
            $0.font = .kreamFont(.custom(size: 12, weight: .semibold))
            $0.textColor = .black06
        }
        buttonBound.do{
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.gray04.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 10
        }
        buttonLabel.do {
            $0.attributedText = "모든 사이즈".toKreamFontString(.custom(size: 14, weight: .bold))
            $0.textColor = .black02
        }
        downArrow.do {
            $0.image = UIImage(named: "icn_downarrow")
        }
    }
    
    //MARK: - Layout
    private func setLayout(){
        [priceSubLabel, priceLabel, productNameEng, productNameKor,buttonBound,buttonLabel,downArrow].forEach{
            self.addSubview($0)
        }
    }
    
    private func setConstraints(){
        
        priceSubLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(81)
            $0.height.equalTo(14)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(priceSubLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(87)
            $0.height.equalTo(23)
        }
        
        productNameEng.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(218)
            $0.height.equalTo(19)
        }
        
        productNameKor.snp.makeConstraints {
            $0.top.equalTo(productNameEng.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(164)
            $0.height.equalTo(14)
        }
        buttonBound.snp.makeConstraints {
            $0.top.equalTo(productNameKor.snp.bottom).offset(18)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        buttonLabel.snp.makeConstraints{
            $0.top.equalTo(buttonBound.snp.top).offset(16.5)
            $0.leading.equalTo(buttonBound.snp.leading).offset(9)
            $0.width.equalTo(65)
            $0.height.equalTo(17)
        }
        downArrow.snp.makeConstraints {
            $0.top.equalTo(buttonBound.snp.top).offset(8.5)
            $0.trailing.equalTo(buttonBound.snp.trailing).inset(9)
            $0.width.height.equalTo(32)
        }
    }
}
#Preview {
    PreviewController(GoodsInfoView(), snp: { view in
        view.snp.makeConstraints {
            $0.center.equalToSuperview()
//            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(222)
        }
    })
}
