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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.96, alpha: 1.0)
        
        let offset = CGFloat(300)
        let bHeight = CGFloat(100)
        // Add Trash Button
        let tframe = CGRectMake(20, offset, 340, bHeight)
        self.tButton = HTPressableButton(frame: tframe, buttonStyle: HTPressableButtonStyle.Rounded)
        self.tButton!.buttonColor = UIColor.ht_peterRiverColor()
        self.tButton!.shadowColor = UIColor.ht_belizeHoleColor()
        self.tButton!.setTitle("TRASH", forState: UIControlState.Normal)
        self.tButton!.addTarget(self, action: "activateCan:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.tButton!)
        // Add Recycling Button
        let rframe = CGRectMake(20, offset + bHeight, 340, bHeight)
        self.rButton = HTPressableButton(frame: rframe, buttonStyle: HTPressableButtonStyle.Rounded)
        self.rButton!.buttonColor = UIColor.ht_grassColor()
        self.rButton!.shadowColor = UIColor.ht_grassDarkColor()
        self.rButton!.setTitle("RECYCLE", forState: UIControlState.Normal)
        self.rButton!.addTarget(self, action: "activateCan:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.rButton!)
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
}

