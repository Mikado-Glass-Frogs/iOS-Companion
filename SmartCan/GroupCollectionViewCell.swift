//
//  GroupCollectionViewCell.swift
//  SmartCan
//
//  Created by Colin King on 1/16/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet var textField: UILabel!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.textField = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        self.textField.text = "Example1"
//        self.addSubview(self.textField);
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    var textField: UILabel!
//    var title: String
    var cellButton: HTPressableButton?
    var collectionViewReference: SCCollectionViewController?
    var indexPath: NSIndexPath?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
//        imageView.contentMode = UIViewContentMode.ScaleAspectFit
//        contentView.addSubview(imageView)
        
        let textFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/3)
        textField = UILabel(frame: textFrame)
        textField.font = UIFont.systemFontOfSize(20)
        textField.textAlignment = .Center
        textField.textColor = UIColor.whiteColor()
        contentView.addSubview(textField)
        3
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clearColor().CGColor
        self.contentView.layer.masksToBounds = true
        
        cellButton = HTPressableButton(frame: CGRectMake(0, 0, self.frame.width, self.frame.height), buttonStyle: HTPressableButtonStyle.Rounded)
        cellButton!.shadowHeight = 10
        cellButton!.buttonColor = UIColor.ht_peterRiverColor()
        cellButton!.shadowColor = UIColor.ht_belizeHoleColor()
        cellButton!.setTitle("Loading...", forState: UIControlState.Normal)
        cellButton!.addTarget(self, action: "transition", forControlEvents: UIControlEvents.TouchUpInside)
        self.contentView.addSubview(cellButton!)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func transition() {
        // DO nothing
        println("method called")
        
        var newViewController: TemplateDetailViewController
        // Pick the view controller
        switch(self.indexPath!.row) {
        case 0:
            newViewController = RedeemViewController()
        case 1:
            newViewController = AchievementsViewController()
        case 2:
            newViewController = RankingViewController()
        case 3:
            newViewController = StatisticsViewController()
        case 4:
            newViewController = ManualCanViewController()
        case 5:
            newViewController = SmartCanViewController()
            //        case 6:
            //            newViewController = SettingsViewController()
        default:
            abort()
        }
        newViewController.titleText = self.textField.text
        
    self.collectionViewReference?.navigationController?.pushViewController(newViewController, animated: true)
    }
}
