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

extension UIView {
    /**
     Loads a xib inside the View
     - Parameter bundle: Bundle that holds the Xib
     - Parameter xibName: Name of the Xib to be loaded. If left blank a Xib with the same name of the class will be loaded
     - Parameter index: Index of View in Xib file
     
     */
    public func addXibInView(from bundle: Bundle? = nil, xibName: String? = nil, index: Int = 0){
        let finalBundle = bundle ?? Bundle(for: type(of: self))
        var xib: String = String(describing: type(of: self))
        if let name = xibName {
            xib = name
        }
        let xibView = finalBundle.loadNibNamed(xib, owner: self, options: nil)![index] as! UIView
        self.addSubviewWithConstraints(xibView)
    }
}
