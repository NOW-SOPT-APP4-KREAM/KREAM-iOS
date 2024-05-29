//
//  ViewController.swift
//  KREAM
//
//  Created by 송여경 on 5/24/24.
//
import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let overlayView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            view.isHidden = true // Hidden by default
            return view
        }()
        
        private let moreLabel: UILabel = {
            let label = UILabel()
            label.text = "+더보기"
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .center
            label.isHidden = true // Hidden by default
            return label
        }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(imageView)
            contentView.addSubview(overlayView)
            overlayView.addSubview(moreLabel)
            
            imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
            overlayView.snp.makeConstraints { $0.edges.equalToSuperview() }
            moreLabel.snp.makeConstraints { $0.center.equalToSuperview() }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func configure(with url: URL, isLastCell: Bool) {
            imageView.load(url: url)
            overlayView.isHidden = !isLastCell
            moreLabel.isHidden = !isLastCell
        }
    }

class ViewController: UIViewController {
    
    private var styles: [ProductStyle] = []
    
    private let collectionView: UICollectionView = {
        let layout = CustomLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isScrollEnabled = false
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func updateStyles(_ styles: [ProductStyle]) {
        self.styles = styles
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return styles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        
        let style = styles[indexPath.item]
        if let url = URL(string: style.imageUrl) {
            let isLastCell = indexPath.item == styles.count - 1
            cell.configure(with: url, isLastCell: isLastCell)
        }
        
        return cell
    }
}


class CustomLayout: UICollectionViewLayout {
    private var layoutAttributes = [UICollectionViewLayoutAttributes]()
    private let itemSpacing: CGFloat = 3
    private let largeCellSize: CGFloat = 262
    private let smallCellSize: CGFloat = 129
    
    override func prepare() {
        super.prepare()
        layoutAttributes.removeAll()
        
        guard let collectionView = collectionView else { return }
        
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        
        for item in 0..<numberOfItems {
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            if item == 0 {
                attributes.frame = CGRect(x: itemSpacing - 3, y: itemSpacing, width: largeCellSize, height: largeCellSize)
            } else if item == 1 {
                attributes.frame = CGRect(x: largeCellSize + (2 * itemSpacing) - 3, y: itemSpacing, width: smallCellSize, height: smallCellSize)
            } else if item == 2 {
                attributes.frame = CGRect(x: largeCellSize + (2 * itemSpacing) - 3, y: smallCellSize + (2 * itemSpacing), width: smallCellSize, height: smallCellSize)
            } else {
                let row = (item - 3) / 3
                let column = (item - 3) % 3
                let x = itemSpacing - 3 + CGFloat(column) * (smallCellSize + itemSpacing)
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
        let height = largeCellSize + (2 * itemSpacing) + CGFloat(rows + 1) * (smallCellSize + itemSpacing)
        
        return CGSize(width: collectionView.bounds.width, height: height)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributes[indexPath.item]
    }
}

#Preview {
    ViewController()
}


