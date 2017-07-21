//
//  TransitionAnim.swift
//  SwiftSimpleAnimations
//
//  Created by jointsky on 2017/7/21.
//  Copyright © 2017年 陈帆. All rights reserved.
//

import UIKit

class TransitionAnim: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        let fromRect = transitionContext.initialFrame(for: fromVC!)
        let toRect = CGRect(x: 0, y: fromRect.size.height, width: fromRect.size.width, height: fromRect.size.height)
        
        let fromView = fromVC?.view
        let toView = toVC?.view
        
        fromView?.frame = fromRect
        toView?.frame = toRect
        toView?.alpha = 0.1
        transitionContext.containerView.addSubview(fromView!)
        transitionContext.containerView.addSubview(toView!)
        
    
        UIView.animate(withDuration: 2.0, animations: {
            toView?.frame = fromRect
            fromView?.frame = CGRect(x: 0, y: -fromRect.size.height, width: fromRect.size.width, height: fromRect.size.height)
            toView?.alpha = 1.0
        }) { (isComplete) in
            transitionContext.completeTransition(true)
        }
    }
    

}
