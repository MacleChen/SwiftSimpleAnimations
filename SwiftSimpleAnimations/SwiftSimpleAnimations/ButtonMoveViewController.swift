//
//  ButtonMoveViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/7.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height


class ButtonMoveViewController: UIViewController {

    @IBOutlet weak var buttonMove: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.clipsToBounds = true
        
        // button cornRadius
        self.buttonMove.setTitle("登录", for: .normal)
        self.buttonMove.layer.masksToBounds = true
        self.buttonMove.layer.cornerRadius = self.buttonMove.bounds.size.height/2;
        
        self.buttonMove.addTarget(self, action: #selector(buttonMove7Cick(sender:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0) { 
//            var buttonFrame = self.buttonMove.frame
//            buttonFrame.origin.x = (SCREEN_WIDTH - buttonFrame.size.width)/2
//            self.buttonMove.frame = buttonFrame
            
            self.buttonMove.center.x = SCREEN_WIDTH/2
            
            print("x:", self.buttonMove.center.x)
            self.buttonMove.alpha = 1.0
            
            // scale
//            self.buttonMove.transform = CGAffineTransform(scaleX: 0.7, y: 1.3)
            
            // turn round
//            self.buttonMove.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            
            // move
//            self.buttonMove.transform = CGAffineTransform(translationX: 0, y: 100)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ButtonMoveViewController {
    @objc func buttonMoveClick( sender: UIButton) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10)
        
//        self.buttonMove.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
//        
//        self.buttonMove.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
////        self.buttonMove.transform = CGAffineTransform(translationX: 50, y: -50)
//    
//        self.buttonMove.alpha = 0
        
        // repeat top and bottom
        
        self.buttonMove.transform = CGAffineTransform(translationX: 0, y: 300)
        
        UIView.commitAnimations()
        
    }
    
    /****************     CABasicAniation 动画      ****************/
    
    // MARK: 位置动画
    @objc func buttonMove2Click(sender: UIButton) {
        // 位置动画 （CALayer）
        let animation: CABasicAnimation = CABasicAnimation()
        
        animation.keyPath = "position"
//        animation.toValue = NSValue(cgPoint: CGPoint(x: sender.frame.origin.x+sender.frame.size.width/2, y: sender.frame.origin.y+sender.frame.size.height/2+300))
        animation.byValue = NSValue(cgPoint: CGPoint(x: -sender.frame.origin.x, y: 300))
        animation.duration = 1
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        sender.layer.add(animation, forKey: nil)
    }
    
    // MARK: 缩放动画
    @objc func buttonMove3Click( sender: UIButton) {
        let animation = CABasicAnimation()
        
        animation.keyPath = "transform.scale.x"
        animation.fromValue = 1.0
        animation.toValue = 0.1
        animation.duration = 0.5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        sender.layer.add(animation, forKey: nil)
        
    }
    
    // MARK: 圆角动画
    @objc func buttonMove4Cick(sender: UIButton) {
        let animation = CABasicAnimation()
        
        animation.keyPath = "cornerRadius"
        animation.toValue = 0
        animation.duration = 2.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        sender.layer.add(animation, forKey: nil)
        
    }
    
    // MARK: 边框动画
    @objc func buttonMove5Cick(sender: UIButton) {
        let animation = CABasicAnimation()
        
        animation.keyPath = "borderWidth"
        animation.toValue = 10
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        sender.layer.add(animation, forKey: nil)
        
    }
    
    
    
    /**********************   CAKeyFrameAnimation    *********************/
    
    // MARK: 淡入淡出效果动画
    @objc func buttonMove6Cick(sender: UIButton) {
        let animation = CAKeyframeAnimation()

        animation.keyPath = "opacity"
        let valuesArray:[NSNumber] = [NSNumber(value: 0.8),
                                      NSNumber(value: 0.6),
                                      NSNumber(value: 0.4),
                                      NSNumber(value: 0.3),
                                      NSNumber(value: 0.2),
                                      NSNumber(value: 0.1),
                                      NSNumber(value: 0.0)]
        
        animation.values = valuesArray
        animation.duration = 2.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        sender.layer.add(animation, forKey: nil)
    }
    
    
    // MARK: 自定义路径动画
    @objc func buttonMove7Cick(sender: UIButton) {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: sender.frame.origin.x+sender.frame.size.width/2, y: sender.frame.origin.y+sender.frame.size.height/2))
        path.addLine(to: CGPoint(x: 300, y: 500))
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = path
        animation.duration = 2.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        sender.layer.add(animation, forKey: nil)
        
    }
}

