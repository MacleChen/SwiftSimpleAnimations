//
//  TurnAroundViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/7.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class TurnAroundViewController: UIViewController {
    
    
    @IBOutlet weak var turnAroundImageViewe: UIImageView!
    
    @IBOutlet weak var sliderView: UISlider!
    
    var index:CGFloat = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func setAroundAnimation1() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelegate(self)
        if (index != CGFloat(MAXFLOAT)) {
            UIView.setAnimationDidStop(#selector(setAroundAnimation1))
        }
        UIView.setAnimationCurve(.linear)
        UIView.setAnimationDuration(TimeInterval(self.sliderView.value))
        index += 1
        let angle = CGFloat(CGFloat(M_PI_2) * index)
        self.turnAroundImageViewe.transform = CGAffineTransform(rotationAngle: angle)
        
        UIView.commitAnimations()
    }
    
    
    func setAroundAnimation2() {
        UIView.animateKeyframes(withDuration: TimeInterval(self.sliderView.value), delay: 0, options: .calculationModeCubicPaced, animations: {
            for indexTemp in 0...3 {
                UIView.addKeyframe(withRelativeStartTime: Double(CGFloat(indexTemp)/CGFloat(4)), relativeDuration: 1/4, animations: {
                    self.index += 1
                    let angle = CGFloat(CGFloat(M_PI/2) * self.index)
                    self.turnAroundImageViewe.transform = CGAffineTransform(rotationAngle: angle)
                })
            }
        }) { (isDone) in
            if (self.index != CGFloat(MAXFLOAT)) {
                self.setAroundAnimation2()
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func beginBtnCLick(_ sender: UIButton) {
        index = 0;
        self.setAroundAnimation1()
    }
    

    @IBAction func endBtnClick(_ sender: UIButton) {
        index = CGFloat(MAXFLOAT)
    }
    
    
    @IBAction func sliderViewValueChange(_ sender: UISlider) {
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
