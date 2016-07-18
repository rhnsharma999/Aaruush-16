//
//  EventsTableViewCell.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 14/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import FoldingCell

class EventsTableViewCell: FoldingCell {
    @IBOutlet var containerViewImage: UIImageView!

    @IBOutlet var containerViewMainTitle: UILabel!
    @IBOutlet var containerViewDescription: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }

}
