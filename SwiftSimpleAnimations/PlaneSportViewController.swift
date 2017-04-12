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
    
    
    @IBAction func animationBtn1Click(_ sender: UIButton) {
        
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
    
    @IBAction func animationBtn2Click(_ sender: UIButton) {
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
    
    @IBAction func animationBtn3Click(_ sender: UIButton) {
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
    
    @IBAction func animationBtn4Click(_ sender: UIButton) {
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
    

}
