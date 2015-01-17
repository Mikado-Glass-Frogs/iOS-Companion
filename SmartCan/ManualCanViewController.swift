//
//  ManualCanViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class ManualCanViewController: UIViewController {
    
    var titleLabel: UILabel = UILabel(frame: CGRectMake(50, 40, 200, 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Welcome to the Manual Can View Controller")
        
        self.view.backgroundColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: UILabel.appearance().font.familyName, size: 23)
        titleLabel.text = "Manual Can"
        self.view.addSubview(titleLabel)
        
    }
}
