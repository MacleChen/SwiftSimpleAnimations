//
//  gradientLabel.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/19.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class GradientLabel: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    // MARK: 设置 GradientLayer
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayerTemp = CAGradientLayer()
        
        // point
        gradientLayerTemp.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayerTemp.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // color
        gradientLayerTemp.colors = [UIColor.darkGray.cgColor, UIColor.white.cgColor, UIColor.darkGray.cgColor]
        
        // locations
        gradientLayerTemp.locations = [0.25, 0.5, 0.75]
        
        
        return gradientLayerTemp
    }()
    
    // MARK: 设置  字体属性
    lazy var textAttributes: [String : AnyObject] = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        
        return [NSFontAttributeName: UIFont.systemFont(ofSize: 17.0),
                NSParagraphStyleAttributeName : style]
    }()
    
    // MARK: 设置 文字
    @IBInspectable var text: String! {
        didSet {
            setNeedsDisplay()
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            text.draw(in: bounds, withAttributes: textAttributes)
            let image = UIGraphicsGetImageFromCurrentImageContext() 
            UIGraphicsEndImageContext()
            
            // layer
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.clear.cgColor
            maskLayer.frame = bounds.offsetBy(dx: bounds.size.width, dy: 0)
            maskLayer.contents = image?.cgImage
            gradientLayer.mask = maskLayer
        }
    }
    
    // MARK: layoutView
    override func layoutSubviews() {
        gradientLayer.frame = CGRect(x: -bounds.size.width, y: bounds.origin.y, width: 3*bounds.size.width, height: bounds.size.height)
        
        layer.addSublayer(gradientLayer)
    }
    
    // MARK: did move Window
    override func didMoveToWindow() {
        let gradientAnim = CABasicAnimation()
        gradientAnim.keyPath = "locations"
        gradientAnim.fromValue = [0.0, 0.0, 0.25]
        gradientAnim.toValue = [0.75, 1.0, 1.0]
        gradientAnim.duration = 3.0
        gradientAnim.repeatCount = Float.infinity
        gradientLayer.add(gradientAnim, forKey: nil)
    }
}
