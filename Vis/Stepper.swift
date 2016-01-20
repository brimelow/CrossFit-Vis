//
//  Stepper.swift
//  Vis
//
//  Created by Lee Brimelow on 1/19/16.
//  Copyright © 2016 Lee Brimelow. All rights reserved.
//

import UIKit

@IBDesignable
class Stepper: UIStepper {

    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            setup()
        }
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
