//
//  ManualCanViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class ManualCanViewController: TemplateDetailViewController {
    
    var tButton: HTPressableButton?
    var rButton: HTPressableButton?
    var qButton: HTPressableButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.96, alpha: 1.0)
        
        let offset = CGFloat(300)
        let bHeight = CGFloat(100)
        
        // Add completion text
        let textLabel = UILabel(frame: CGRectMake(0, 100, 375, 80))
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.textColor = UIColor.whiteColor()
        textLabel.numberOfLines = 2
        textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLabel.text = "Scan your product's QR code\nto find out if it can be recycled"
        textLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        self.view.addSubview(textLabel)
        
        // Add QR-Code Taking Button
        let qframe = CGRectMake(20, 200, 340, 100)
        self.qButton = HTPressableButton(frame: qframe, buttonStyle: HTPressableButtonStyle.Rounded)
        self.qButton!.buttonColor = UIColor.ht_mintColor()
        self.qButton!.shadowColor = UIColor.ht_mintDarkColor()
        self.qButton!.setTitle("SCAN QR", forState: UIControlState.Normal)
        self.qButton!.addTarget(self, action: "scanQR", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.qButton!)
        
        // Add Recycling Button
        let rframe = CGRectMake(20, 430, 340, 100)
        self.rButton = HTPressableButton(frame: rframe, buttonStyle: HTPressableButtonStyle.Rounded)
        self.rButton!.buttonColor = UIColor.ht_grassColor()
        self.rButton!.shadowColor = UIColor.ht_grassDarkColor()
        self.rButton!.setTitle("RECYCLE", forState: UIControlState.Normal)
        self.rButton!.addTarget(self, action: "activateCan:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.rButton!)
        
        // Add completion text
        let textLabel2 = UILabel(frame: CGRectMake(0, 320, 375, 80))
        textLabel2.textAlignment = NSTextAlignment.Center
        textLabel2.textColor = UIColor.whiteColor()
        textLabel2.numberOfLines = 2
        textLabel2.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLabel2.text = "Manually operate your SmartCan\nfrom your iPhone"
        textLabel2.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        self.view.addSubview(textLabel2)
        // Add Trash Button
        let tframe = CGRectMake(20, 550, 340, 100)
        self.tButton = HTPressableButton(frame: tframe, buttonStyle: HTPressableButtonStyle.Rounded)
        self.tButton!.buttonColor = UIColor.ht_peterRiverColor()
        self.tButton!.shadowColor = UIColor.ht_belizeHoleColor()
        self.tButton!.setTitle("TRASH", forState: UIControlState.Normal)
        self.tButton!.addTarget(self, action: "activateCan:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.tButton!)
    }
    
    func disableButtons() {
        self.rButton!.enabled = false
        self.tButton!.enabled = false
    }
    
    func enableButtons() {
        self.rButton!.enabled = true
        self.tButton!.enabled = true
    }
    
    func activateCan(button: UIButton) {
        
        // TODO Direct user to take barcode image and process it to get barcode number
        
        self.disableButtons()
        
        var url: NSURL
        
        if(button.titleLabel?.text! == "RECYCLE") {
            // Activate the recycling
            url = NSURL(string: "http://192.168.15.125:44000/recycle")!
        } else {
            // Activate the trash
            url = NSURL(string: "http://192.168.15.125:44000/trash")!
        }
        //Send the request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, error) -> Void in
            dispatch_async(dispatch_get_main_queue(),{
                self.enableButtons()
            });
        }
    }
    
    func scanQR() {
        println("Scan QR")
        // Present a modal with the QRReadViewController
        let qrReadViewController = QRReadViewController()
        self.presentViewController(qrReadViewController, animated: true, completion: nil)
    }
}

