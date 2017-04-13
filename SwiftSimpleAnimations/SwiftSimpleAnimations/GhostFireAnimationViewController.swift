//
//  GhostFireAnimationViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/13.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class GhostFireAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.clipsToBounds = true

        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(touchBackgroundEvent(sender:)))
        self.view.addGestureRecognizer(gesture)
        
        // Do any additional setup after loading the view.
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // hiden status bar
        UIApplication.shared.isStatusBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        UIApplication.shared.isStatusBarHidden = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // emitterCell
        let emitterCell = CAEmitterCell()
        
        emitterCell.name = "fire"
        emitterCell.emissionLongitude = CGFloat(M_PI)
        emitterCell.velocity = -1           // 粒子速度  负数标识向上运动
        emitterCell.velocityRange = 200      // 粒子速度范围
        emitterCell.emissionRange =   50   // 粒子发射角度
        emitterCell.yAcceleration = -800    // y方向的加速度分量
        emitterCell.scaleSpeed = 1.0        // 缩放比例
        emitterCell.color = UIColor.red.cgColor
        emitterCell.contents = UIImage.init(named: "fire")?.cgImage
        emitterCell.birthRate = 6
        emitterCell.lifetime = 2
        
        // emitterLayer
        let emitterLayer = CAEmitterLayer()
        
        emitterLayer.position = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height)
        emitterLayer.emitterSize = CGSize(width: 50, height: 10)    // 控制火苗的大小
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterShape = kCAEmitterLayerLine
        emitterLayer.emitterCells = [emitterCell]
        
        self.view.layer.addSublayer(emitterLayer)
//        
//        emitterLayer.setValue(500, forKey: "emitterCells.fire.birthRate")  // 生成速度
//        emitterLayer.setValue(1, forKey: "emitterCells.fire.lifetime")
        
        
    }
    
    
    @objc func touchBackgroundEvent(sender: UIGestureRecognizer) {
       _ = self.navigationController?.popViewController(animated: true)
    }

}
