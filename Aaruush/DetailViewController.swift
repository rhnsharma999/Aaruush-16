//
//  DetailViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var photoToShow:String!
    var nameToShow:String!
    override func viewDidLoad() {
        
        nameLabel.text = nameToShow
        photo.image = UIImage(named: photoToShow);
        
        photo.layer.masksToBounds = true;
        
        photo.layer.cornerRadius = photo.bounds.size.width/2;
        photo.layer.borderWidth = 1.0;
        photo.layer.borderColor = UIColor.whiteColor().CGColor
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
