//
//  DomainsCollectionViewCell.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 23/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class FiveSWalaCell: UICollectionViewCell {
    
    
    @IBOutlet var photoTitle: UILabel!
    
    @IBOutlet var photo: UIImageView!
    
    
    
     
    override func layoutSubviews() {
        photo.layer.cornerRadius = photoTitle.bounds.width/2;
        photo.layer.masksToBounds = true;
        
      /*  if(UIScreen.mainScreen().bounds.height == 568)
        {
            photo.transform = CGAffineTransformMakeScale(0.8, 0.8)
            photo.center.x -= 10
        }*/
    }
    
    
}
