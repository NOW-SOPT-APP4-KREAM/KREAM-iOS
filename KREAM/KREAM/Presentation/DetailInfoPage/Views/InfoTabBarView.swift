//
//  InfoTabBarView.swift
//  KREAM
//
//  Created by 송여경 on 5/23/24.
//

import UIKit
import Then
import SnapKit

class InfoTabBarView : UIView {
    
    weak var navigationController: UINavigationController?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpStyle()
        setLayout()
        setConstraints()
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Set Elements
    private let backButton = UIButton()
    
    private let addAlarmImageView = UIImageView()
    
    private let shareImageView = UIImageView()
    
    //MARK: - Setup
    func setUpStyle(){
        backButton.do{
            $0.setImage(UIImage(named: "icn_back"),for: .normal)
        }
        addAlarmImageView.do{
            $0.image = UIImage(named: "icn_addalarm")
        }
        shareImageView.do{
            $0.image = UIImage(named: "icn_share")
        }
    }
    
    //MARK: - Layout
    private func setLayout(){
        [backButton, addAlarmImageView, shareImageView].forEach{self.addSubview($0)
        }
    }
    
    private func setConstraints(){
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(32)
        }
        
        addAlarmImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.leading.equalTo(backButton.snp.trailing).offset(232)
            $0.width.height.equalTo(32)
        }
        
        shareImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.leading.equalTo(addAlarmImageView.snp.trailing).offset(15)
            $0.width.height.equalTo(32)
        }
        
        
    }
    //MARK: - GoToBack(Button)
        private func setUpViews() {
            backButton.addTarget(self, action: #selector(BackButtonDidTap), for: .touchUpInside)
        }
        
        @objc private func BackButtonDidTap() {
            navigationController?.popViewController(animated: true)
        }
    
}
