//
//  BarChartView.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit


let barColor = UIColor.red


class BarChartView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let barChart = CAShapeLayer()
    let pathAnimation = CABasicAnimation()
    
    // init 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        barChart.lineWidth = 20.0
        barChart.lineCap =  kCALineCapSquare
        barChart.lineJoin = kCALineJoinRound
        barChart.strokeColor = barColor.cgColor
        barChart.strokeEnd = 0.0
        self.layer.addSublayer(barChart)
        
    }
    
    
    // add animation
    func barChartAnimation() {
        barChart.strokeEnd = 1.0
        barChart.add(pathAnimation, forKey: nil)
    }
    
    // draw
    override func draw(_ rect: CGRect) {
        // bezier Path
        let bezierPath = UIBezierPath()
        
        for i in  0...4 {
            bezierPath.move(to: CGPoint(x: 40 + 40 * i, y: 250))
            bezierPath.addLine(to: CGPoint(x: 40 + 40 * i, y: 250-i*20-10))
        }
        barChart.path = bezierPath.cgPath
        
        // animation
        pathAnimation.keyPath = "strokeEnd"
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.duration = 4.0
        pathAnimation.autoreverses = false
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
