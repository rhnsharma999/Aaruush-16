//
//  TeamCustomCellCollectionViewCell.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

public var fr = CGRectMake(0, 0, 0, 0);

class SixSWalaCell: UICollectionViewCell {
    
    @IBOutlet var activity: UIActivityIndicatorView!
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    
    
    override func layoutSubviews() {
        
        activity.startAnimating()
        myImage.layer.cornerRadius = myImage.bounds.width/2;
        myImage.layer.masksToBounds = true;
        myImage.layer.borderColor = UIColor.whiteColor().CGColor;
        myImage.layer.borderWidth = 2
        
        fr = self.myImage.frame;
        
        
        
    
        
    }
    
   
}
