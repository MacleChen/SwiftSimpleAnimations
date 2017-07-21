//
//  MytestView.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/20.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

@IBDesignable
class MytestView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var keyboardView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // cornerRadius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    // borderWith
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // borderColor
    @IBInspectable var borderColor: UIColor! {
        didSet {
            layer.borderColor = borderColor.cgColor
            
        }
    }

}
