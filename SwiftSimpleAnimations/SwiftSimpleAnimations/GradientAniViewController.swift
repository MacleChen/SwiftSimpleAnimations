//
//  GradientAniViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/19.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class GradientAniViewController: UIViewController {

    
    @IBOutlet weak var showLockLabel: UILabel!
    
    @IBOutlet weak var viewBgImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 设置梯度动画字体
        let gradientLabel = GradientLabel(frame: self.showLockLabel.frame)
        gradientLabel.text = self.showLockLabel.text
        self.showLockLabel.text = ""
        self.view.addSubview(gradientLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.shared.statusBarStyle = .lightContent
        
//        // 设置lock Gradient Color animation
//        let gradientLayer = CAGradientLayer.init()
//        gradientLayer.frame = self.showLockLabel.frame
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
//        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.blue.cgColor, UIColor.clear.cgColor]
//        gradientLayer.locations = [0.0, 0.1, 0.2]
//        self.viewBgImageView.layer.addSublayer(gradientLayer)
//        
//        // Basicanimation
//        let gradientAnim = CABasicAnimation()
//        gradientAnim.keyPath = "locations"
//        gradientAnim.fromValue = [0.0, 0.1, 0.2]
//        gradientAnim.toValue = [0.8, 0.9, 1.0]
//        gradientAnim.duration = 3;
//        gradientAnim.repeatCount = 10;
//        gradientLayer.add(gradientAnim, forKey: nil)
    
        
        
    }
    
    // MARK: 
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
