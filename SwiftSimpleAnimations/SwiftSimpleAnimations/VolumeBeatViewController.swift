//
//  VolumeBeatViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/4.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class VolumeBeatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "音量跳动"
        
        
        /// 音量跳动
        // CAReplicatorLayer
        let replicatorLayer: CAReplicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0, y: 0, width: 375, height: 250)
        replicatorLayer.instanceCount = 20
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        replicatorLayer.instanceDelay = 0.2
        replicatorLayer.masksToBounds = true
        replicatorLayer.backgroundColor = UIColor.blue.cgColor
        
        // CABasicAnimation
        let layer = CALayer()
        layer.frame = CGRect(x: 14, y: 250, width: 10, height: 100)
        layer.backgroundColor = UIColor.orange.cgColor
        layer.masksToBounds = true
        layer.cornerRadius = 5
        replicatorLayer.addSublayer(layer)
        self.view.layer.addSublayer(replicatorLayer)
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.duration = 0.5
        animation.fromValue = 250
        animation.toValue = 220
        animation.autoreverses = true
        animation.repeatCount = MAXFLOAT
        layer.add(animation, forKey: nil)
        
        
        /// 心电图
        // CAReplicatorLayer
        let replicatorLayer2: CAReplicatorLayer = CAReplicatorLayer()
        replicatorLayer2.frame = CGRect(x: 0, y: 250, width: 375, height: 400)
        replicatorLayer2.instanceCount = 375
        replicatorLayer2.instanceTransform = CATransform3DMakeTranslation(1, 0, 0)
        replicatorLayer2.instanceDelay = 0.01
        replicatorLayer2.masksToBounds = true
        replicatorLayer2.backgroundColor = UIColor.black.cgColor
        
        // CABasicAnimation
        let layer2 = CALayer()
        layer2.frame = CGRect(x: 15, y: 250, width: 5, height: 5)
        layer2.backgroundColor = UIColor.green.cgColor
        layer2.masksToBounds = true
        layer2.cornerRadius = 5
        replicatorLayer2.addSublayer(layer2)
        self.view.layer.addSublayer(replicatorLayer2)
        let animation2 = CABasicAnimation()
        animation2.keyPath = "position.y"
        animation2.duration = 0.5
        animation2.fromValue = 250
        animation2.toValue = 150
        animation2.autoreverses = true
        animation2.repeatCount = MAXFLOAT
        layer2.add(animation2, forKey: nil)
        
        
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

}
