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
        
        self.buttonMove.addTarget(self, action: #selector(buttonMoveClick(sender:)), for: .touchUpInside)
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
}

