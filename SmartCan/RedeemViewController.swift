//
//  RedeemViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class RedeemViewController: TemplateDetailViewController {
    
    var datagrabber = DataGrabber()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //header
        let header = UITextField(frame: CGRectMake(20, 100, 250, 40))
        
        header.text = "Your Current Balance Is: $0"
        
        //Calculate the current balance
        header.text
        
    }
}