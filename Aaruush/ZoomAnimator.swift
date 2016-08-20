//
//  ZoomAnimator.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 19/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class ZoomAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    
    let duration    = 1.0
    var presenting  = true
    var originFrame = CGRect.zero
    
    var my:Bool!
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration;
        
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        
        let containerView = transitionContext.containerView()
        let toViewc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
       
        containerView?.addSubview(fromViewc.view);
        containerView?.addSubview(toViewc.view)
        
        //toViewc.view.hidden = true;
        toViewc.view.center.x += toViewc.view.bounds.width;
        
        UIView.animateWithDuration(0.5, animations: {
            
            
            
            
            fromViewc.view.center.x -= fromViewc.view.bounds.width;
            toViewc.view.center.x += toViewc.view.bounds.width;
            
            
            
            }, completion: {my in
        
        
                transitionContext.completeTransition(true);
                
        
        })
        
        
        
        
        
        /*
        let containerView = transitionContext.containerView()!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let herbView = presenting ? toView : transitionContext.viewForKey(UITransitionContextFromViewKey)!
        
        let initialFrame = presenting ? originFrame : herbView.frame
        let finalFrame = presenting ? herbView.frame : originFrame
        
        let xScaleFactor = presenting ?
            initialFrame.width / finalFrame.width :
            finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting ?
            initialFrame.height / finalFrame.height :
            finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransformMakeScale(xScaleFactor, yScaleFactor)
        
        if presenting {
            herbView.transform = scaleTransform
            herbView.center = CGPoint(
                x: CGRectGetMidX(initialFrame),
                y: CGRectGetMidY(initialFrame))
            herbView.clipsToBounds = true
        }
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(herbView)
        
        UIView.animateWithDuration(duration, delay:0.0,
                                   usingSpringWithDamping: 0.4,
                                   initialSpringVelocity: 0.0,
                                   options: [],
                                   animations: {
                                    herbView.transform = self.presenting ?
                                        CGAffineTransformIdentity : scaleTransform
                                    
                                    herbView.center = CGPoint(x: CGRectGetMidX(finalFrame),
                                        y: CGRectGetMidY(finalFrame))
                                    
            }, completion:{_ in
                transitionContext.completeTransition(true)
        })
        */
        
        
    }
}
