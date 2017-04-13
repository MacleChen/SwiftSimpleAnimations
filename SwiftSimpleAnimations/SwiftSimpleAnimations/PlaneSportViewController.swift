//
//  PlaneSportViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/10.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class PlaneSportViewController: UIViewController {
    
    public var titleStr: String? = nil
    
    
    @IBOutlet weak var planeImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.titleStr
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeLinear, animations: {
//            self.planeImageView.frame = CGRect(x: 280, y: 270, width: 100, height: 30)
//        }) { (isDone) in
//            print("done")
//            self.planeImageView.frame = CGRect(x: 20, y: 110, width: 66, height: 15)
//        }
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeCubicPaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 300, y: 100, width: 66, height: 15)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 280, y: 270, width: 100, height: 30)
            })
            
        }) { (isDone) in
            print("done")
            self.planeImageView.frame = CGRect(x: 20, y: 110, width: 66, height: 15)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("sender:\(sender)")
    }
    
    
    @IBAction func animationBtnAllClick(_ sender: UIButton) {
        
        self.animationBtn5Click(sender: sender)
    }
    
    @objc func animationBtn1Click(sender: UIButton) {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 300, y: 100, width: 66, height: 15)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 280, y: 270, width: 100, height: 30)
            })
            
        }) { (isDone) in
            print("done")
            self.planeImageView.frame = CGRect(x: 20, y: 110, width: 66, height: 15)
        }
    }
    
    @objc func animationBtn2Click(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 300, y: 100, width: 66, height: 15)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 280, y: 270, width: 100, height: 30)
            })
            
        }) { (isDone) in
            print("done")
            self.planeImageView.frame = CGRect(x: 20, y: 110, width: 66, height: 15)
        }
    }
    
    @objc func animationBtn3Click(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeDiscrete, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 300, y: 100, width: 66, height: 15)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 280, y: 270, width: 100, height: 30)
            })
            
        }) { (isDone) in
            print("done")
            self.planeImageView.frame = CGRect(x: 20, y: 110, width: 66, height: 15)
        }
    }
    
    @objc func animationBtn4Click(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 300, y: 100, width: 66, height: 15)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.planeImageView.frame = CGRect(x: 280, y: 270, width: 100, height: 30)
            })
            
        }) { (isDone) in
            print("done")
            self.planeImageView.frame = CGRect(x: 20, y: 110, width: 66, height: 15)
        }
    }
    
    
    
    /****************    CAKeyFrameAnimation   *****************/
    
    // MARK: 增加弧线飞行动画
    @objc func animationBtn5Click(sender: UIButton) {
//        let planePositionX:CGFloat = self.planeImageView.frame.origin.x + self.planeImageView.frame.size.width/2
//        let planePositionY:CGFloat = self.planeImageView.frame.origin.y + self.planeImageView.frame.size.height/2
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.planeImageView.frame.origin.x, y: self.planeImageView.frame.origin.y))
        path.addLine(to: CGPoint(x: 150, y: self.planeImageView.frame.origin.y))
        path.addArc(center: CGPoint(x: 150, y: 270), radius: 160, startAngle: CGFloat(M_PI_2)*3, endAngle: 0, clockwise: false)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = path
        animation.duration = 0.5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        self.planeImageView.layer.add(animation, forKey: nil)
    }
    

}
