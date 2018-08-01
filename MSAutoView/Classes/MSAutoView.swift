/**
 MIT License
 
 Copyright (c) 2018 MaherKSantina
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

public protocol MSXibEmbedding: AnyObject {
    static var xibBundle: Bundle? { set get  }
    static var xibName: String? { set get }
    var xibItems: [Any]? { set get }
    
    func loadXibMainView(topConstant: CGFloat, leftConstant: CGFloat, bottomConstant: CGFloat, rightConstant: CGFloat) -> [NSLayoutConstraint]
    func loadXibItems() -> [Any]
}

extension MSXibEmbedding where Self: UIView {
    
    @discardableResult
    public func loadXibMainView(topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        self.xibItems = loadXibItems()
        let view = self.xibItems?[0] as! UIView
        return addSubviewWithConstraints(view, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant)
    }
    
    public func loadXibItems() -> [Any] {
        return (Self.xibBundle ?? Bundle(for: type(of: self))).loadNibNamed(Self.xibName ?? String(describing: type(of: self)), owner: self, options: nil) ?? []
    }
}

open class MSAutoView: UIView, MSXibEmbedding {
    
    public static var xibBundle: Bundle?
    public static var xibName: String?
    public var xibItems: [Any]?
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    open func initView() {
        loadXibMainView()
    }
    
    open func updateView() {
        //Override
    }
    
    open func updateEmptyView() {
        //Override
    }
    
}

