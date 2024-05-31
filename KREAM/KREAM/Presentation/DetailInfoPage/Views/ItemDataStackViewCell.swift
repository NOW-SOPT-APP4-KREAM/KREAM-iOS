//
//  ItemDataStackViewCell.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//
import UIKit
import SnapKit
import Then

final class ItemDataStackViewCell: UIView {
    
    // MARK: Properties
    // MARK: Views
    private let detailStackView = UIStackView()
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let bottomStackView = UIStackView()
    private let waveImage = UIImageView()
    private let waveLabel = UILabel()
    private var isFirstCell: Bool = false

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpStyle()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpViews
    private func setUpViews() {
        addSubview(detailStackView)
        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.addArrangedSubview(priceLabel)
        detailStackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(waveImage)
        bottomStackView.addArrangedSubview(waveLabel)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        detailStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
        }
        
        titleLabel.do {
            $0.font = .kreamFont(.body6(.semibold))
            $0.textColor = .black06
            $0.numberOfLines = 0
        }
        
        priceLabel.do {
            $0.font = .kreamFont(.body5(.semibold)).withSize(12)
            $0.textColor = .black03
            $0.numberOfLines = 0
        }
        
        waveImage.do {
            $0.image = UIImage(named: "icn_down")
        }
        
        waveLabel.do {
            $0.font = .systemFont(ofSize: 11, weight: .bold)
            $0.textColor = .green02
            $0.numberOfLines = 1
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        detailStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        waveImage.snp.makeConstraints {
            $0.width.height.equalTo(8)
        }
        
//        waveLabel.snp.makeConstraints {
//            $0.height.equalTo(14)
//        }
    }
    
    // MARK: External Function
    func configure(title: String, content: String, wave: UIImage?, isFirstCell: Bool) {
        self.isFirstCell = isFirstCell
        self.titleLabel.text = title
        self.priceLabel.text = content
        
        if let waveImage = wave {
            self.waveImage.image = waveImage
            self.bottomStackView.isHidden = false
        } else {
            self.bottomStackView.isHidden = true
        }
        
        self.snp.remakeConstraints { make in
            make.width.equalTo(isFirstCell ? 130 : 75)
//            make.height.equalTo(45)
//            make.verticalEdges.equalToSuperview()
        }
        
        bottomStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    func addBottomData(variablePrice: String, variablePercent: String) {
        self.waveLabel.text = "\(variablePrice)\(variablePercent)%"
//        self.bottomStackView.snp.makeConstraints {
//            $0.width.equalTo(106)
//        }
    }
}
