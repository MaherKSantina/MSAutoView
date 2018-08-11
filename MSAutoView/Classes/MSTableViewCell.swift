//
//  MSTableViewCell<T>.swift
//  MSAutoView
//
//  Created by Maher Santina on 8/10/18.
//

import UIKit

open class MSTableViewCell<T: UIView>: UITableViewCell {
    
    public var mainView = T()
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
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
    }
}


public protocol TableViewCellContainable {
    associatedtype TableViewCellContainedViewType: UIView
    
    var tableViewCell: MSTableViewCell<TableViewCellContainedViewType> { get }
    static var tableViewCell: MSTableViewCell<TableViewCellContainedViewType>.Type { get }
}

extension TableViewCellContainable where Self: UIView {

    public var tableViewCell: MSTableViewCell<Self> {
        return MSTableViewCell()
    }
    
    public static var tableViewCell: MSTableViewCell<Self>.Type {
        return MSTableViewCell<Self>.self
    }
}

extension UIView: TableViewCellContainable { }
