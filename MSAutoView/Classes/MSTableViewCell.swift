//
//  MSTableViewCell<T>.swift
//  MSAutoView
//
//  Created by Maher Santina on 8/10/18.
//

import UIKit

public class MSTableViewCell<T: UIView>: UITableViewCell {
    
    var mainView = T()
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView() {
        contentView.addSubviewWithConstraints(mainView)
        backgroundColor = mainView.backgroundColor
    }
}


public protocol CellContainable {
    associatedtype CellContainedViewType: UIView
    
    var cell: MSTableViewCell<CellContainedViewType> { get }
    static var cell: MSTableViewCell<CellContainedViewType>.Type { get }
}

extension CellContainable where Self: UIView {

    public var cell: MSTableViewCell<Self> {
        return MSTableViewCell()
    }
    
    public static var cell: MSTableViewCell<Self>.Type {
        return MSTableViewCell<Self>.self
    }
}

extension UIView: CellContainable { }
