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
    
    var tableView: UITableView?
    
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
        self.view.addSubview(self.tableView!)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("achievementCell") as? AchievementTableViewCell
        
        if (cell == nil) {
//            let nib = NSBundle.mainBundle().loadNibNamed("AchievementTableCell", owner: self, options: nil)
//            cell = nib[0] as AchievementTableViewCell
//            cell = AchievementTableViewCell(style: )
//            UITableViewCell(style: <#UITableViewCellStyle#>, reuseIdentifier: <#String?#>)
        }
        
//        cell.achievementTitle.text = achievements[indexPath.row]
//        cell.percentTitle.text = "90%"
//        cell.trophyImage.image = UIImage(named: "trophy")
        
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
    
    
}
