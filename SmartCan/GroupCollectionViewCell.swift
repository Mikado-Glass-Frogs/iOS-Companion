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
    var textField: UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
//        imageView.contentMode = UIViewContentMode.ScaleAspectFit
//        contentView.addSubview(imageView)
        
        let textFrame = CGRect(x: 0, y: 20, width: frame.size.width, height: frame.size.height/3)
        textField = UILabel(frame: textFrame)
        textField.font = UIFont.systemFontOfSize(32)
        textField.textAlignment = .Center
        textField.textColor = UIColor.whiteColor()
        contentView.addSubview(textField)
        
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clearColor().CGColor
        self.contentView.layer.masksToBounds = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
