//
//  RecommendationViewController.swift
//  KREAM
//
//  Created by 박민서 on 5/24/24.
//

import UIKit
import SnapKit
import Then

final class RecommendationViewController: UIViewController {
    
    // MARK: Properties
    private var forYouList: [ItemDetail] = []
    private var justDroppedList: [ItemDetail] = []
    
    // MARK: Views
    let wholeScrollView = UIScrollView()
    private let circleInfoView = ItemCircleInfoView()
    private let forYouView = ForYouView()
    private let justDroppedView = JustDroppedView()
    private let cardInfoView = CardInfoCollectionView()
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLayout()
        setUpStyle()
        setUpConstraint()
        getRecommendResult()
    }
    
    // MARK: setUpViews
    private func setUpViews() {
    
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            circleInfoView,
            forYouView,
            justDroppedView,
            cardInfoView
        ].forEach { wholeScrollView.addSubview($0) }
        
        self.view.addSubview(wholeScrollView)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        wholeScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        wholeScrollView.contentLayoutGuide.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        circleInfoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(242)
        }
        
        forYouView.snp.makeConstraints {
            $0.top.equalTo(circleInfoView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(565)
        }
        
        justDroppedView.snp.makeConstraints {
            $0.top.equalTo(forYouView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(363)
        }
        
        cardInfoView.snp.makeConstraints {
            $0.top.equalTo(justDroppedView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(224)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: API Logic
private extension RecommendationViewController {
    func getRecommendResult() {
        APIService<KreamTargetType>()
            .sendRequest(target: .getRecommendedProducts(memberId: 1),
                         instance: RecommendProductResponseDTO.self,
                         completion: {
                result in
                switch result {
                    
                case .success(let success):
                    self.justDroppedList = success.data.justDropList.map {
                        .init(
                            itemId: 0,
                            isPreviouslySeen: false,
                            tradeVolume: $0.transactionCount,
                            imageUrl: $0.thumbnailURL,
                            isBookmarked: $0.isScrap,
                            brandName: $0.brandTitle,
                            isCheck: false, // TODO: 이거 확인 필요
                            englishName: $0.engTitle,
                            koreanName: nil,
                            isExpress: $0.isFast,
                            isCoupon: $0.isCoupon,
                            isSave: $0.isSave,
                            isFreeShip: $0.isFreeDeliver,
                            price: $0.price,
                            isBuyNowPrice: true,
                            bookmarkCount: nil,
                            heartCount: nil
                        )
                    }
                    self.forYouList = success.data.forYouList.map {
                        .init(
                            itemId: 0,
                            isPreviouslySeen: false, // TODO: 이거 로직 필요
                            tradeVolume: $0.transactionCount,
                            imageUrl: $0.thumbnailURL,
                            isBookmarked: nil,
                            brandName: $0.brandTitle,
                            isCheck: false,
                            englishName: $0.engTitle,
                            koreanName: nil,
                            isExpress: false,
                            isCoupon: false,
                            isSave: false,
                            isFreeShip: false,
                            price: $0.price,
                            isBuyNowPrice: false,
                            bookmarkCount: nil,
                            heartCount: nil
                        )
                    }
                    self.refreshViewDatas()
                    
                case .failure(let error):
                    print(error)
                    return
                }
            })
    }
}

private extension RecommendationViewController {
    func refreshViewDatas() {
        self.forYouView.configure(list: self.forYouList)
        self.justDroppedView.configure(list: self.justDroppedList)
        self.view.layoutIfNeeded()
    }
}

#Preview {
    RecommendationViewController()
}
