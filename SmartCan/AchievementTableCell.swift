//
//  AchievementTableViewCell.swift
//  SmartCan
//
//  Created by Colin King on 1/18/15.
//  Copyright (c) 2015 Colin King. All rights reserved.
//

import UIKit

class AchievementTableCell: UITableViewCell {
    @IBOutlet weak var achievementTitle: UILabel!
    @IBOutlet weak var percentTitle: UILabel!
    @IBOutlet weak var trophyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
