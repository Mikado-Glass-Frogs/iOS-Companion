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
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.Plain, target: self, action: "backButtonPressed")
    }
    
    func backButtonPressed() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
