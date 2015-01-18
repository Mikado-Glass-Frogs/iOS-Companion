//
//  NavigationControllerDelegate.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionAnimator()
    }
}
