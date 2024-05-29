//
//  ForthViewController.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit
import Then
import Moya


class ForthViewController: UIViewController, UIScrollViewDelegate {

    let scrollView = UIScrollView()
    let provider = APIService<KreamTargetType>()
    
    let infoTabBarView = InfoTabBarView().then {
        $0.backgroundColor = .white
    }
    let productImageView = ProductImageView().then {
        $0.backgroundColor = .yellow01
    }
    let goodsInfoView = GoodsInfoView()
    let productBenefitView = ProductBenefitView()
    let deliveryInfoView = DeliveryInfoView()
    let styleTopView = StyleTopView()
    let itemInfoStickyView = ItemInfoStickyView().then {
        $0.backgroundColor = .white
    }
    let moreStyleView = MoreStyleView()
    let imageViewController = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        view.addSubviews(scrollView, itemInfoStickyView, infoTabBarView)

        scrollView.delegate = self
        self.view.backgroundColor = .white

        let contentView = UIView()
        scrollView.addSubview(contentView)

        contentView.addSubviews(productImageView, goodsInfoView, productBenefitView, deliveryInfoView, styleTopView, moreStyleView)

        self.addChild(imageViewController)
        
        contentView.addSubview(imageViewController.view)

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.snp.makeConstraints {
            $0.top.equalTo(infoTabBarView)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(itemInfoStickyView.snp.top)
        }

        itemInfoStickyView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualTo(scrollView.snp.height).priority(.low)
        }

        infoTabBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(44)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }

        productImageView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(375)
        }

        goodsInfoView.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(222)
        }

        productBenefitView.snp.makeConstraints {
            $0.top.equalTo(goodsInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(108)
        }

        deliveryInfoView.snp.makeConstraints {
            $0.top.equalTo(productBenefitView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }

        styleTopView.snp.makeConstraints {
            $0.top.equalTo(deliveryInfoView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(61)
        }

        imageViewController.view.snp.makeConstraints {
            $0.top.equalTo(styleTopView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(550)
//            $0.bottom.equalToSuperview()
        }

        imageViewController.didMove(toParent: self)

        moreStyleView.snp.makeConstraints {
            $0.top.equalTo(imageViewController.view.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
            $0.bottom.equalTo(scrollView.snp.bottom).inset(20)
        }

        fetchData()
    }
    
    func fetchData() {
        provider.request(.getProductDetail(memberId: 1, productId: 1)) { result in
            switch result {
            case .success(let response):
                do {
                    let product = try JSONDecoder().decode(Product.self, from: response.data)
//                    print("@TAG - \(product.data)")
                    self.updateView(with: product.data)
//                    self.updateStyles(with: product.data.styles)
                } catch {
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error)")
            }
        }
    }

    func updateView(with data: ProductData) {
        if let url = URL(string: data.thumbnailUrl) {
            productImageView.productImage.load(url: url)
        }
        goodsInfoView.priceLabel.text = data.price
        goodsInfoView.productNameEng.text = data.engTitle
        goodsInfoView.productNameKor.text = data.title
        styleTopView.configureStyleCount(data.styleCount)
        
        itemInfoStickyView.configure(scrapCount: data.scrapCount, cellPrice: data.cellPrice)
        
        goodsInfoView.updateDataStackView(
            recentPrice: data.recentPrice,
            variablePrice: data.variablePrice,
            variablePercent: data.variablePercent,
            releasePrice: data.releasePrice,
            modelNumber: data.modelNumber,
            releaseDate: data.releaseDate,
            includeImage: true
        )
        
        imageViewController.updateStyles(data.styles)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        }
    }

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}


extension GoodsInfoView {
    func updateDataStackView(recentPrice: String, variablePrice: String, variablePercent: String, releasePrice: String, modelNumber: String, releaseDate: String, includeImage: Bool) {
        dataStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let apiData = ["최근 거래가", "발매가", "모델번호", "출시일"]
        let priceData = [
            "\(recentPrice)\n\(variablePrice) \((variablePercent))",
            releasePrice,
            modelNumber,
            releaseDate
        ]
        
        for (index, item) in apiData.enumerated() {
            let cell = ItemDataStackViewCell()
            let waveImage: UIImage? = (index == 0 && includeImage) ? UIImage(named: "icn_down") : nil
            cell.configure(title: item, content: priceData[index], wave: waveImage)

            // 스택 뷰에 셀 추가
            dataStackView.addArrangedSubview(cell)
            
            // 마지막 셀인지 확인하여 divider 추가
            if index < apiData.count - 1 {
                let divider = UIView()
                divider.snp.makeConstraints {
                    $0.width.equalTo(3)
                    $0.height.equalTo(45)
                }
                divider.backgroundColor = .gray06
                dataStackView.addArrangedSubview(divider)
            }
        }
    }
}

////MARK:API

#Preview{
    ForthViewController()
}
