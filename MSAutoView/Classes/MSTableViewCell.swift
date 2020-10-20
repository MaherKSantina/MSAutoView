//
//  MSTableViewCell<T>.swift
//  MSAutoView
//
//  Created by Maher Santina on 8/10/18.
//
#if canImport(UIKit)
import UIKit

open class MSTableViewCell<T: MSXibEmbedding>: UITableViewCell {
    
    public var mainView = T()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        mainView.tableViewCell = self
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        mainView.prepareForReuse()
    }
}


public protocol TableViewCellContainable {
    associatedtype TableViewCellContainedViewType: MSXibEmbedding
    
    static var tableViewCell: MSTableViewCell<TableViewCellContainedViewType>.Type { get }
}

extension TableViewCellContainable where Self: MSXibEmbedding {
    
    public static var tableViewCell: MSTableViewCell<Self>.Type {
        return MSTableViewCell<Self>.self
    }
}

extension MSAutoView: TableViewCellContainable { }
#endif
