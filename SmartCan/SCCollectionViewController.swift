//
//  SCCollectionViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/16/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit


let reuseIdentifier = "Cell"
let titles = ["Redeem",
    "Acheivements",
    "Rankings",
    "Statistics",
    "Can Operator",
    "SmartCan Locator",
    "Settings"]
let colors = [
    "#F44336",
    "#8BC34A",
    "#9C27B0",
    "#FFC107",
    "#2196F3",
    "#FF5722",
    "#00BCD4"
]

class SCCollectionViewController: UICollectionViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.registerClass(GroupCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        self.title = "SmartCan"
        
        // Example code
        
        let cityInfo = NSDictionary(dictionary: ["country": "United States"])
        
        let data = cityInfo.BSONDocument().dataValue()
        
        let cityInfoDecoded = BSONDecoder.decodeDictionaryWithData(data)
        println("City Info Decoded: \(cityInfoDecoded)")
        let dbConn: MongoConnection = MongoConnection(forServer: "107.170.91.187", error: nil)
        let collection: MongoDBCollection = dbConn.collectionWithName("pennapps.personal_data")
        collection.insertDictionary(cityInfo, writeConcern: nil, error: nil)
        
        // End Sample Code
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return titles.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        self.collectionView?.registerClass(GroupCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        var cell: GroupCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as GroupCollectionViewCell
        
        // Configure the cell
        
        cell.textField.text = titles[indexPath.row]
        cell.backgroundColor = colorWithHexString(colors[indexPath.row])
        
        //cell.textField.text = titles[indexPath.row]
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!,sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: 340, height: 200)
    }

    private let sectionInsets = UIEdgeInsets(top: 30.0, left: 0.0, bottom: 20.0, right: 0.0)
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    // MARK: Color Helper
    
    // Creates a UIColor from a Hex string.
    // Found from Gist: https://gist.github.com/arshad/de147c42d7b3063ef7bc
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        if (countElements(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = (cString as NSString).substringToIndex(2)
        var gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        var bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var newViewController: UIViewController
        
        // Pick the view controller
        switch(indexPath.row) {
        case 0:
            println("0")
            newViewController = RedeemViewController()
        case 1:
            println("1")
            newViewController = AchievementsViewController()
        case 2:
            println("2")
            newViewController = RankingViewController()
        case 3:
            println("3")
            newViewController = StatisticsViewController()
        case 4:
            println("4")
            newViewController = ManualCanViewController()
        case 5: // Settings
            println("5")
            newViewController = SmartCanViewController()
        case 6: // Redeem
            println("6")
            newViewController = SettingsViewController()
        default:
            println("WOW.. YOU MESSED UP BOY, how'd you forget a title like that?")
            abort()
        }
        
        // Present the new view controller
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
