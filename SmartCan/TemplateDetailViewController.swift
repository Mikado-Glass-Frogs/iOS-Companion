//
//  TemplateDetailViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class TemplateDetailViewController: UIViewController {
    var backgroundColor: UIColor?;
    var titleText: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = self.titleText!
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "backButtonPressed")
//        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "backButtonPressed")
//        self.navigationController?.navigationItem.leftBarButtonItem = backButton
//        let button = UIButton.buttonWithType(UIButtonType.Custom)
////        button.frame = CGRectMake(0, 0, 40, 40)
//        button.setImage(UIImage(named: "back_button_image_name"), forState: UIControlState.Normal)
//        button.addTarget(self, action: "backButtonPressed", forControlEvents: UIControlEvents.TouchUpInside)
//        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func backButtonPressed() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}