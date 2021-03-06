//
//  MSCollectionViewCell.swift
//  MSAutoView
//
//  Created by Maher Santina on 8/11/18.
//
#if canImport(UIKit)
import UIKit

open class MSCollectionViewCell<T: MSXibEmbedding>: UICollectionViewCell {
    public var mainView = T()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    public func initView() {
        mainView.removeFromSuperview()
        contentView.addSubviewWithConstraints(mainView)
        backgroundColor = mainView.backgroundColor
        mainView.collectionViewCell = self
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        mainView.prepareForReuse()
    }
}

public protocol CollectionViewCellContainable {
    associatedtype CollectionViewCellContainedViewType: MSAutoView
    
    static var collectionViewCell: MSCollectionViewCell<CollectionViewCellContainedViewType>.Type { get }
}

extension CollectionViewCellContainable where Self: MSXibEmbedding {
    
    public static var collectionViewCell: MSCollectionViewCell<Self>.Type {
        return MSCollectionViewCell<Self>.self
    }
}

extension MSAutoView: CollectionViewCellContainable { }
#endif
