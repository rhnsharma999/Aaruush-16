//
//  FeedTableViewCell.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 20/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var activity: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.width/2;
        profileImage.layer.masksToBounds = true
        profileImage.backgroundColor = UIColor.clearColor()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
       // super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
