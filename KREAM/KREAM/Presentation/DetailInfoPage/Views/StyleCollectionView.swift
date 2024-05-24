//
//  StyleCollectionView.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//

import UIKit
import SnapKit
import Then

class StyleCollectionView: UICollectionView {
    init() {
        let customLayout = CustomLayout()
        super.init(frame: .zero, collectionViewLayout: customLayout)
        
        setupCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
}

class CustomLayout: UICollectionViewLayout {
    //MARK: Set Elements
    private var layoutAttributes = [UICollectionViewLayoutAttributes]()
    private let itemSpacing: CGFloat = 3
    private let largeCellSize: CGFloat = 249
    private let smallCellSize: CGFloat = 123

    
    override func prepare() {
        super.prepare()
        layoutAttributes.removeAll()
        
        guard let collectionView = collectionView else { return }
        
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            if item == 0 {
                attributes.frame = CGRect(x: itemSpacing, y: itemSpacing, width: largeCellSize, height: largeCellSize)
            } else if item == 1 {
                attributes.frame = CGRect(x: largeCellSize + (2 * itemSpacing), y: itemSpacing, width: smallCellSize, height: smallCellSize)
            } else if item == 2 {
                attributes.frame = CGRect(x: largeCellSize + (2 * itemSpacing), y: smallCellSize + (2 * itemSpacing), width: smallCellSize, height: smallCellSize)
            } // 크기가 다른 상단 3개의 이미지만 이렇게 해주었습니다.
            else {
                let row = (item - 3) / 3
                let column = (item - 3) % 3
                let x = itemSpacing + CGFloat(column) * (smallCellSize + itemSpacing)
                let y = largeCellSize + (2 * itemSpacing) + CGFloat(row) * (smallCellSize + itemSpacing)
                attributes.frame = CGRect(x: x, y: y, width: smallCellSize, height: smallCellSize)
            }
            
            layoutAttributes.append(attributes)
        }
    }
    
    
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return .zero }
        
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let rows = (numberOfItems - 3) / 3
        let height = largeCellSize + (2 * itemSpacing) + CGFloat(rows + 1) * (smallCellSize + itemSpacing) // 높이 계산을 해주었음
        
        return CGSize(width: collectionView.bounds.width, height: height)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributes[indexPath.item]
    }
}
