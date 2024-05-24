//
//  ForthViewController.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit
import Then

class ForthViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView = UIScrollView()
    
    let infoTabBarView = InfoTabBarView().then {
        $0.backgroundColor = .white
    }
    
    let productImageView = ProductImageView()
    let goodsInfoView = GoodsInfoView()
    let productBenefitView = ProductBenefitView()
    let deliveryInfoView = DeliveryInfoView()
    let styleTopView = UIView().then {
        $0.backgroundColor = .black
    }
    let itemInfoStickyView = ItemInfoStickyView().then {
        $0.backgroundColor = .white
    }
    let imageViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(scrollView, itemInfoStickyView)

        scrollView.delegate = self
        
        self.view.backgroundColor = .white
           
        let contentView = UIView()
        scrollView.addSubview(contentView)

        contentView.addSubviews( productImageView, goodsInfoView, productBenefitView, deliveryInfoView, styleTopView, infoTabBarView)
        
        self.addChild(imageViewController)
        
        contentView.addSubview(imageViewController.view)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(itemInfoStickyView.snp.top)
            
        }
        
        itemInfoStickyView.snp.makeConstraints{
            $0.height.equalTo(100)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
//            $0.height.greaterThanOrEqualTo(scrollView.contentSize.height)
        }
        
        infoTabBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        productImageView.snp.makeConstraints{
            $0.top.equalTo(infoTabBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(375)
        }
        
        goodsInfoView.snp.makeConstraints{
            $0.top.equalTo(productImageView.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(222)
        }
        productBenefitView.snp.makeConstraints{
            $0.top.equalTo(goodsInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(108)
        }
        deliveryInfoView.snp.makeConstraints{
            $0.top.equalTo(productBenefitView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        styleTopView.snp.makeConstraints{
            $0.top.equalTo(deliveryInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(61)
            
        }
        
        // TODO: COllectionView add
        imageViewController.view.snp.makeConstraints {
            $0.top.equalTo(styleTopView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
            $0.bottom.equalToSuperview()
        }
        
        imageViewController.didMove(toParent: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}


#Preview{
    ForthViewController()
}
