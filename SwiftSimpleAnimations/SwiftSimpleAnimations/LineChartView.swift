//
//  LineChartView.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

let lineColor = UIColor.red


class LineChartView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var chartShape: CAShapeLayer = CAShapeLayer()
    var chartAnimiation = CABasicAnimation()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        chartShape.lineCap = kCALineCapRound
        chartShape.lineJoin = kCALineJoinRound
        chartShape.lineWidth = 10.0
        chartShape.strokeColor = lineColor.cgColor
        chartShape.strokeEnd = 0.0
        self.layer.addSublayer(chartShape)
        
    }
    
    // 自定义刷新动画的函数
    func drawChartLine() {
        chartShape.strokeEnd = 1.0
        chartShape.add(chartAnimiation, forKey: nil)
    }
    
    // draw
    override func draw(_ rect: CGRect) {
        let chartBezier: UIBezierPath = UIBezierPath()
        chartBezier.move(to: CGPoint(x: 100, y: 50))
        chartBezier.addLine(to: CGPoint(x: 150, y: 200))
        chartBezier.addLine(to: CGPoint(x: 200, y: 130))
        chartBezier.addLine(to: CGPoint(x: 230, y: 160))
        chartBezier.addLine(to: CGPoint(x: 290, y: 80))
        chartShape.path = chartBezier.cgPath
        
        // set animiation
        chartAnimiation.keyPath = "strokeEnd"
        chartAnimiation.fromValue = 0.0
        chartAnimiation.toValue = 1.0
        chartAnimiation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        chartAnimiation.duration = 2.0
        chartAnimiation.autoreverses = false
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
