//
//  AchievementTableViewCell.swift
//  SmartCan
//
//  Created by Colin King on 1/18/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trophyImage: UIImageView!
    @IBOutlet weak var percentTitle: UILabel!
    @IBOutlet weak var achievementTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
