//
//  AppDelegate.swift
//  SmartCan
//
//  Created by Colin King on 1/16/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavigation: UINavigationController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let themeColor = UIColor(red: 0.4, green: 0.8, blue: 0.96, alpha: 0.1)
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.tintColor = themeColor
    
        UILabel.appearance().font = UIFont(name: "AppleSDGothicNeo-Thin", size: 17)
        UILabel.appearance().tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(24)]
        UINavigationBar.appearance().barTintColor = themeColor
        UINavigationBar.appearance().translucent = true
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(340, 200)
        
        let mainCollectionView: SCCollectionViewController = SCCollectionViewController(collectionViewLayout: flowLayout)
        
        mainCollectionView.collectionView?.backgroundColor = UIColor.whiteColor()
        
        self.mainNavigation = UINavigationController(rootViewController: mainCollectionView)
        self.window?.rootViewController = self.mainNavigation
        self.window?.makeKeyAndVisible()
        
//        self.mainNavigation?.title = "Smart Can"
//        let shadow: NSShadow = NSShadow()
//        shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
//        shadow.shadowOffset = CGSizeMake(0, 1)
//        let font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 21)
//        let color = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
//        let dict = [NSForegroundColorAttributeName: color, NSShadowAttributeName: shadow, NSFontAttributeName: font]
//        UINavigationBar.appearance().titleTextAttributes = NSDictionary(dictionary: dict)
        
        //Venmo.startWithAppId("", secret: "", name: "PennApps SmartCan")
        
        let data = DataGrabber().data
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

