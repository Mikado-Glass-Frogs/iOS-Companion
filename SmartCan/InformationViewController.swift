//
//  InformationViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/18/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    var data: String?
    var backButton: HTPressableButton?
    var throwButton: HTPressableButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.96, alpha: 1.0)
        
        println("IN THE NEW VIEW CONTROLLER: \(self.data!)")
        
        let indexOfLastElement = advance(data!.startIndex, countElements(data!)-1)
        let c = data![indexOfLastElement]
        
        
        let textLabel = UILabel(frame: CGRectMake(0, 180, 375, 80))
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.textColor = UIColor.whiteColor()
        textLabel.numberOfLines = 2
        textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLabel.text = "THIS ITEM IS"
        textLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 40)
        self.view.addSubview(textLabel)
        
        // "UUID,RECYCLABLE" 0 = TRASH
        if(c == "0") {
            // Add completion text
            let textLabel2 = UILabel(frame: CGRectMake(0, 230, 375, 80))
            textLabel2.textAlignment = NSTextAlignment.Center
            textLabel2.textColor = UIColor.ht_peterRiverColor()
            textLabel2.numberOfLines = 2
            textLabel2.lineBreakMode = NSLineBreakMode.ByWordWrapping
            textLabel2.text = "TRASH"
            textLabel2.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 60)
            self.view.addSubview(textLabel2)
        
            let throwframe = CGRectMake(20, 430, 340, 100)
            self.throwButton = HTPressableButton(frame: throwframe, buttonStyle: HTPressableButtonStyle.Rounded)
            self.throwButton!.buttonColor = UIColor.ht_peterRiverColor()
            self.throwButton!.shadowColor = UIColor.ht_belizeHoleColor()
            self.throwButton!.setTitle("TRASH", forState: UIControlState.Normal)
            self.throwButton!.addTarget(self, action: "activateCan:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(self.throwButton!)
        } else {
            // Add completion text
            let textLabel2 = UILabel(frame: CGRectMake(0, 230, 375, 80))
            textLabel2.textAlignment = NSTextAlignment.Center
            textLabel2.textColor = UIColor.ht_grassColor()
            textLabel2.numberOfLines = 2
            textLabel2.lineBreakMode = NSLineBreakMode.ByWordWrapping
            textLabel2.text = "RECYCLABLE"
            textLabel2.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 60)
            self.view.addSubview(textLabel2)
            
            let throwframe = CGRectMake(20, 430, 340, 100)
            self.throwButton = HTPressableButton(frame: throwframe, buttonStyle: HTPressableButtonStyle.Rounded)
            self.throwButton!.buttonColor = UIColor.ht_grassColor()
            self.throwButton!.shadowColor = UIColor.ht_grassDarkColor()
            self.throwButton!.setTitle("RECYCLE", forState: UIControlState.Normal)
            self.throwButton!.addTarget(self, action: "activateCan:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(self.throwButton!)
        }
    
    
    
    // Add Back Button
    let backframe = CGRectMake(20, 550, 340, 100)
    self.backButton = HTPressableButton(frame: backframe, buttonStyle: HTPressableButtonStyle.Rounded)
    self.backButton!.buttonColor = UIColor.ht_bitterSweetColor()
    self.backButton!.shadowColor = UIColor.ht_bitterSweetDarkColor()
    self.backButton!.setTitle("BACK", forState: UIControlState.Normal)
    self.backButton!.addTarget(self, action: "dismiss", forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(self.backButton!)
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/

func dismiss() {
    self.dismissViewControllerAnimated(true, completion: nil)
}
    
    func activateCan(button: UIButton) {
        
        // TODO Direct user to take barcode image and process it to get barcode number
        

        
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

        }
    }

}
