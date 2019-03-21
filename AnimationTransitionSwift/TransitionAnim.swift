//
//  TransitionAnim.swift
//  Animation_转场
//
//  Created by SPIREJ on 2018/11/30.
//  Copyright © 2018年 xiangshang360. All rights reserved.
//

import UIKit

class TransitionAnim: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC:UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        let toVC:UIViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        let fromVCRect = transitionContext.initialFrame(for: fromVC)
        let toVCRect = CGRect(x: 0, y: fromVCRect.size.height*2, width: fromVCRect.size.width, height: fromVCRect.size.height)
        
        let fromView:UIView = fromVC.view
        let toView = toVC.view
        
        fromView.frame = fromVCRect
        toView?.frame = toVCRect
        
        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView!)
        
        UIView.animate(withDuration: 2, animations: {
            
            toView?.frame = fromVCRect
            toView?.alpha = 1
            
        }) { (completion) in
            
            transitionContext.completeTransition(true)
        }
    }

}
