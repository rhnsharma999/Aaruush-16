//
//  detailTableViewCell.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 14/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class detailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var details: UITextView!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
