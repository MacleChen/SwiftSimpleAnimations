//
//  FrameAnimiationViewController.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/4/12.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class FrameAnimiationViewController: UIViewController {

    @IBOutlet weak var showAnimationImageView: UIImageView!
    
    @IBOutlet weak var sliderView: UISlider!
    
    @IBOutlet weak var showValueLabel: UILabel!
    
    fileprivate var blackholeView:BlackHoleView!
    
    fileprivate var displayLink: CADisplayLink!
    
    fileprivate var repeatCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.showAnimationImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        self.showAnimationImageView.center = self.view.center
//        self.showAnimationImageView.layer.masksToBounds = true
//        self.showAnimationImageView.layer.cornerRadius = 50/2
        
        
        // black hole
        self.blackholeView = BlackHoleView(frame: self.view.frame)
        self.blackholeView.backgroundColor = UIColor.orange
        self.view.addSubview(self.blackholeView)
        self.view.sendSubview(toBack: self.blackholeView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeAnimateClick(_ sender: UIButton) {
        repeatCount = 1;
        // Timer
        /*
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimeLoop), userInfo: nil, repeats: true)
        timer.fire()
        */
        
        // CADisplayLink
        self.setDisplayInvalidate()
        self.displayLink = CADisplayLink.init(target: self, selector: #selector(runTimeLoop))
        self.displayLink.preferredFramesPerSecond = Int(self.sliderView.value)
        self.displayLink.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func runTimeLoop() {
        self.showAnimationImageView.image = UIImage.init(named: "\(self.repeatCount % 11 + 1)")
        
        
        self.blackholeView.backgroundColor = self.repeatCount % 2 == 0 ? UIColor.yellow : UIColor.white
        self.repeatCount += 1
    }

    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        self.showValueLabel.text = "\(Int(sender.value))帧数"
        self.blackholeView.setHoleRadius(radius: CGFloat(sender.value))
        self.setDisplayInvalidate()
        
    }
    
    func setDisplayInvalidate() {
        if (self.displayLink != nil) {
            self.displayLink.isPaused = true
            self.displayLink.invalidate()
            self.displayLink = nil
        }
    }
}
