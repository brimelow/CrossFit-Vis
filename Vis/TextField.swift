//
//  TextField.swift
//  Vis
//
//  Created by Lee Brimelow on 1/19/16.
//  Copyright © 2016 Lee Brimelow. All rights reserved.
//

import UIKit

@IBDesignable
class TextField: UITextField {
    
    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var inset: CGFloat = 0
    @IBInspectable var height: CGFloat = 30 {
        didSet {
            var f = self.frame
            f.size.height = height
            self.frame = f
        }
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, inset, inset)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRectForBounds(bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func setup() {
        self.backgroundColor = UIColor.clearColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = 10

    }

}
