//
//  TeamCustomCellCollectionViewCell.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class TeamCustomCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    
    override func layoutSubviews() {
        myImage.layer.cornerRadius = myImage.bounds.width/2;
        myImage.layer.masksToBounds = true;
        myImage.layer.borderColor = UIColor.whiteColor().CGColor;
        myImage.layer.borderWidth = 2
        
    }
}
