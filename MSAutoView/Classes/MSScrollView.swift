//
//  MSScrollView.swift
//  MSAutoView
//
//  Created by Maher Santina on 8/14/18.
//
#if canImport(UIKit)
import UIKit

open class MSScrollView<T: UIView>: UIScrollView {
    public var mainView: T?
    
    public func initView(mainView: T) {
        self.mainView?.removeFromSuperview()
        addSubviewWithConstraints(mainView)
        let constraint = NSLayoutConstraint(item: mainView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        addConstraint(constraint)
        self.mainView = mainView
    }
    
}

public protocol ScrollViewContainable {
    associatedtype ScrollViewContainedType: UIView
    
    var scrollView: MSScrollView<ScrollViewContainedType> { get }
    static var scrollView: MSScrollView<ScrollViewContainedType>.Type { get }
}

extension ScrollViewContainable where Self: MSXibEmbedding {
    public var scrollView: MSScrollView<Self> {
        let scrollView = MSScrollView<Self>()
        scrollView.initView(mainView: self)
        return scrollView
    }
    
    public static var scrollView: MSScrollView<Self>.Type {
        return MSScrollView<Self>.self
    }
}

extension MSAutoView: ScrollViewContainable { }
#endif
