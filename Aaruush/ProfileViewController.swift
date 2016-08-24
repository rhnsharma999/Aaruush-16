//
//  ProfileViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 19/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var profileImage: UIImageView!

    @IBOutlet var name: UILabel!
    
    
    var image:String!
    override func viewDidLoad() {
        
        profileImage.image = UIImage(named: image);
        name.text = image;
        
        
        
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil);
        
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
