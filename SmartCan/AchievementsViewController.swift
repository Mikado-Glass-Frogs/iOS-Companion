//
//  AchievementsViewController.swift
//  SmartCan
//
//  Created by Colin King on 1/17/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class AchievementsViewController: TemplateDetailViewController, UITableViewDataSource, UITableViewDelegate {
    
    let achievements = [
    "10 Items Recycled", "50 Items Recycled", "200 Items Recycled", "500 Items Recycled", "1000 Items Recycled", "10k Items Recycled"
    ]
    let amounts = [10, 50, 200, 500, 1000, 10000]
    
    var total_recycled: Int?
    
    var tableView: UITableView?
    
    var num_achievements_comp = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.96, alpha: 1.0)
        
        // TODO Put Trophy image with percentege bar towards completion of all listed trophies, including text of fraciton complete
        let topWindowHeight = CGFloat(400)
        self.tableView = UITableView(frame: CGRectMake(0, topWindowHeight, self.view.frame.size.width, self.view.frame.size.height-topWindowHeight), style: UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.contentInset = UIEdgeInsets(top: -60, left: 0, bottom: 0, right: 0)
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "achievementCell")
        self.tableView!.registerNib(UINib(nibName: "AchievementTableCell", bundle: nil), forCellReuseIdentifier: "achievementCell")
        self.view.addSubview(self.tableView!)
        
        let dg = DataGrabber()
        let keyPath = "container.axlui.password.total_recycle"
        self.total_recycled = dg.getDataAt(keyPath).toInt()
        
        // Calcluate completion
        
        num_achievements_comp = 0
        for amount in amounts {
            if(amount <= total_recycled) {
                num_achievements_comp++
            }
        }
        
        // Add image to top view
        let imgv = UIImageView(frame: CGRectMake(0, 60, 375, 300))
        imgv.image = UIImage(named: "trophy")
        self.view.addSubview(imgv)
        
        // Add completion text
        let textLabel2 = UILabel(frame: CGRectMake(0, 300, 375, 40))
//        textLabel.textColor = UIColor(red: 255, green: 219, blue: 76, alpha: 1.0)
        textLabel2.textAlignment = NSTextAlignment.Center
        let textLabel = UILabel(frame: CGRectMake(0, 320, 375, 40))
        textLabel2.textColor = UIColor(red: 255.0/255.0, green: 219.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        textLabel.textAlignment = NSTextAlignment.Center
        let fraction = String(num_achievements_comp) + "/" + String(achievements.count)
        let percent = String(num_achievements_comp/achievements.count)
        textLabel.text = fraction
        textLabel2.text = String(num_achievements_comp) + " ACHIEVEMENTS COMPLETED"
        textLabel2.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
//        self.view.addSubview(textLabel)
        self.view.addSubview(textLabel2)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("achievementCell") as? AchievementTableCell
        
//        if (cell == nil) {
////            println("NIL nib")
//            let nib = NSBundle.mainBundle().loadNibNamed("AchievementTableCell", owner: self, options: nil)
//            cell = nib[0] as AchievementTableCell
////            cell = AchievementTableViewCell(style: )
////            UITableViewCell(style: <#UITableViewCellStyle#>, reuseIdentifier: <#String?#>)
//        }
        
        cell!.achievementTitle.text = achievements[indexPath.row]
        var percent = self.total_recycled!/amounts[indexPath.row]
        if(percent >= 1) {
            cell!.trophyImage.image = UIImage(named: "trophy")
            percent = 1
        } else {
            cell!.trophyImage.image = UIImage(named: "trophy_bw")
        }
        cell!.percentTitle.text = String(percent) + "%"
        
        
//        cell.textLabel?.text = achievements[indexPath.row]
//        // TODO: Determine if completed or not
//        //       Set the image with the completed achievement image or not completed image
////        cell.imageView?.image = UIImage(named: "trophy")
//        cell.contentView.addSubview(UIImageView(image: UIImage(named: "trophy")))
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 69
    }
    
}
