//
//  CircleAnimateViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/5.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit


class CircleAnimateViewController: UIViewController, CAAnimationDelegate {

    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var beginAnimateBtn: UIButton!
    
    let lineWidth: NSNumber = 10.0
    let strokeColor = UIColor.orange
    let circle = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func beginAnimateBtnClick(_ sender: UIButton) {
        circle.removeAllAnimations()
//        let percentValue: CGFloat = 50
        
        let matrix = 6 - CGFloat(self.slider.value)/25.0
        
        let startAngle: CGFloat = -180.0/180.0 * CGFloat(M_PI)
        let endAngle: CGFloat = -(90.01*matrix)/180.0 * CGFloat(M_PI)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height - 120*3), radius: 120/2-2, startAngle:startAngle, endAngle: endAngle, clockwise: true)
//        let circlePath = UIBezierPath(ovalIn: CGRect(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height - 120*3, width: 60, height: 100))
//        let circlePath = UIBezierPath(rect: CGRect(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height - 120*3, width: 60, height: 100))
//        circlePath.addArc(withCenter: circlePath.currentPoint, radius: 10.0, startAngle:-45.0/180.0 * CGFloat(M_PI) + endAngle, endAngle: -90.01/180.0 * CGFloat(M_PI) + endAngle, clockwise: false)
        
        circlePath.addLine(to: CGPoint(x: circlePath.currentPoint.x + 5.0, y: circlePath.currentPoint.y - 8.0))
        circlePath.addLine(to: CGPoint(x: circlePath.currentPoint.x-5, y: circlePath.currentPoint.y+5))
        circle.path = circlePath.cgPath
        circle.lineCap = kCALineCapRound
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = strokeColor.cgColor
        circle.lineWidth = lineWidth as! CGFloat
        circle.borderColor = UIColor.white.cgColor
        circle.borderWidth = lineWidth as! CGFloat
        self.view.layer.addSublayer(circle)
        
        
        
        // CABasicAnimation
        let pathAnimation = CABasicAnimation()
        pathAnimation.keyPath = "strokeEnd"
        pathAnimation.delegate = self
        pathAnimation.duration = 3.0*Double(self.slider.value/100)
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        pathAnimation.setValue("strokeEndAnimationcircle", forKey: "groupborderkeycircle")
        circle.add(pathAnimation, forKey: "strokeEndAnimationcircle")
        
    }

}
