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
        
        let header = UILabel(frame: CGRectMake(20, 20, 340, 300))
        header.text = "REDEEM WITH SQUARE CASH"
        header.textColor = UIColor.grayColor()
        header.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 50)
        header.numberOfLines = 0
        header.textAlignment = NSTextAlignment.Center
        self.view.addSubview(header)
        
        let imageView = UIImageView(frame: CGRectMake(30, 210, 300, 300))
        let image = UIImage(named: "square")
        imageView.image = image
        imageView.alpha = 0.2
        self.view.addSubview(imageView)
        
        //TODO: Get the current balance from MongoDB
        let balance = UILabel(frame: CGRectMake(0, 480, 375, 60))
        
        let dg = DataGrabber()
        let keyPath = "container.axlui.password.current_balance"
        balance.text = "BALANCE: $" + dg.getDataAt(keyPath)
        balance.textColor = UIColor.grayColor()
        balance.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 46)
        balance.textAlignment = NSTextAlignment.Center
        self.view.addSubview(balance)
        
        
        let cashOutButton = HTPressableButton(frame: CGRectMake(20, 550, 340, 100), buttonStyle: HTPressableButtonStyle.Rounded)
        cashOutButton.shadowHeight = 10
        cashOutButton.setTitle("CASH OUT", forState: UIControlState.Normal)
        cashOutButton.addTarget(self, action: "cashout", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cashOutButton)
    }
    
    func cashout() {
        // TODO: Interface with Cash to pay the user
        println("Cash out pressed!")
    }
    
    
}