//
//  ManualCanViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class ManualCanViewController: UINavigationController {
    
    var titleLabel: UILabel = UILabel(frame: CGRectMake(50, 40, 200, 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Welcome to the Manual Can View Controller")
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(titleLabel)
        
        
        
        // Add Trash Button
        let tframe = CGRectMake(20, 150, 340, 200)
        let tButton = HTPressableButton(frame: tframe, buttonStyle: HTPressableButtonStyle.Rect)
        tButton.buttonColor = UIColor.ht_grapeFruitColor()
        tButton.shadowColor = UIColor.ht_grapeFruitDarkColor()
        tButton.setTitle("TRASH", forState: UIControlState.Normal)
        self.view.addSubview(tButton)
        // Add Recycling Button
        let rframe = CGRectMake(20, 550, 340, 200)
        let rButton = HTPressableButton(frame: rframe, buttonStyle: HTPressableButtonStyle.Rect)
        rButton.buttonColor = UIColor.ht_mintColor()
        rButton.shadowColor = UIColor.ht_mintDarkColor()
        rButton.setTitle("RECYCLE", forState: UIControlState.Normal)
        self.view.addSubview(rButton)
    }
}
