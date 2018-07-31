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

protocol XibEmbedding: AnyObject {
    static var xibBundle: Bundle? { set get  }
    static var xibName: String? { set get }
    var xibItems: [Any]? { set get }
    
    func loadXibMainView()
    func loadXibItems() -> [Any]
}

extension XibEmbedding where Self: UIView {
    
    func loadXibMainView() {
        self.xibItems = loadXibItems()
        let view = self.xibItems?[0] as! UIView
        addSubviewWithConstraints(view)
    }
    
    func loadXibItems() -> [Any] {
        return (Self.xibBundle ?? Bundle(for: type(of: self))).loadNibNamed(Self.xibName ?? String(describing: type(of: self)), owner: self, options: nil) ?? []
    }
}

open class MSAutoView: UIView, XibEmbedding {
    
    static var xibBundle: Bundle?
    static var xibName: String?
    var xibItems: [Any]?
    
    
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

