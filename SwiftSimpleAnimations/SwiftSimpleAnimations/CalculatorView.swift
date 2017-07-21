//
//  CalculatorView.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/20.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

@IBDesignable
class CalculatorView: UIView {

    @IBOutlet weak var keyboardView: UIView!

    @IBOutlet weak var titleLabel: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // cornerRadius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            if  keyboardView != nil {
                keyboardView.layer.cornerRadius = cornerRadius
                keyboardView.layer.masksToBounds = cornerRadius > 0
            }
        }
    }
    
    // textFont
    @IBInspectable var textSize: CGFloat = 15.0 {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: textSize)
        }
    }
    
    // borderColor
    
    // borderWidth
    
    // shadowColor
    
    // shadowOffset
    
    // shadowRadius
    
    // opacity
}
