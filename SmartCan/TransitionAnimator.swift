//
//  TransitionAnimator.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        //1
        self.transitionContext = transitionContext
        
        //2
        var containerView = transitionContext.containerView()
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as SCCollectionViewController
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as TemplateDetailViewController
        //var button = (fromViewController.collectionView)
        let frame = CGRectMake(200, 400, 10, 10)

        //3
        containerView.addSubview(toViewController.view)
        
        //4
        var circleMaskPathInitial = UIBezierPath(ovalInRect: frame)//button.frame)
        var extremePoint = CGPoint(x: -200, y: -CGRectGetHeight(toViewController.view.bounds))
        var radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y))
        var circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(frame, -radius, -radius))
        
        //5
        var maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toViewController.view.layer.mask = maskLayer
        
        //6
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
    
}
