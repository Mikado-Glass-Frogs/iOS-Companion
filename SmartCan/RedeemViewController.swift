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
        
        let header = UILabel(frame: CGRectMake(20, 0, 340, 300))
        header.text = "REDEEM EARNED CASH"
        header.textColor = UIColor.grayColor()
        header.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 50)
        header.numberOfLines = 0
        header.textAlignment = NSTextAlignment.Center
        header.textColor = UIColor.whiteColor()
        self.view.addSubview(header)
        
        let imageView = UIImageView(frame: CGRectMake(30, 190, 300, 300))
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
        balance.textColor = UIColor.whiteColor()
        balance.textAlignment = NSTextAlignment.Center
        self.view.addSubview(balance)
        
        
        let cashOutButton = HTPressableButton(frame: CGRectMake(20, 550, 340, 100), buttonStyle: HTPressableButtonStyle.Rounded)
        cashOutButton.shadowHeight = 10
        cashOutButton.buttonColor = UIColor.ht_peterRiverColor()
        cashOutButton.shadowColor = UIColor.ht_belizeHoleColor()
        cashOutButton.setTitle("CASH OUT", forState: UIControlState.Normal)
        cashOutButton.addTarget(self, action: "cashout", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cashOutButton)
    }
    
    func cashout() {
        // During the competition, I wasn't able to get the necessary API application keys from Venmo's developer page since Venmo apparently couldn't "verify my identity". So this app isn't completely integrated with Venmo.
//        Venmo.sharedInstance().setDefaultTransactionMethod(VENTransactionMethodAppSwitch)
    }
    
    
}