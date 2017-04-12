//
//  BlackHoleView.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/12.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class BlackHoleView: UIView {
    fileprivate var radius:CGFloat = 0;

    func setHoleRadius(radius: CGFloat) {
        self.radius = radius
        self.setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.magenta.cgColor)
        
        // 绘圆
        context.addArc(center: self.center, radius: self.radius, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        
        // 路径
        context.addPath(CGPath(rect: CGRect(x: 0, y: 100, width: self.radius*4, height: 2), transform: nil))
    
        
        // 直线
//        context.addLine(to: CGPoint(x: self.radius, y: self.radius))
        
        context.fillPath()
    }



}
