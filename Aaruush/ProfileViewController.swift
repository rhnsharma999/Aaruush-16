//
//  ProfileViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 04/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import ImageLoader

class ProfileViewController: UIViewController {
    
    var profile:String!;
    var name:String!
    var pos:String!;
    var fbURL:String!
    var phoneNumber:String!
    
   // var testString:String!
    

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var posLabel: UILabel!
    override func viewDidLoad() {
        
        profileImage.load(profile)
        
        nameLabel.text = name;
        posLabel.text = pos;
        
      
      //  testString =  String(fbURL.characters.dropFirst(25))
       // print(testString)
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true;
        
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
        
    }
    @IBAction func openFB(sender: AnyObject) {
        
        let link = "fb://profile/" + String(fbURL.characters.dropFirst(25))
        let url = NSURL(string: link);
        
        
        if(UIApplication.sharedApplication().canOpenURL(url!))
        {
            UIApplication.sharedApplication().openURL(url!)
        }
        else{
            UIApplication.sharedApplication().openURL(NSURL(string: fbURL)!)
            
        }
    }

    @IBAction func call(sender: AnyObject) {
        
        
        
        let alert = UIAlertController(title: "Call Number", message: "Call "+name + "?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Call", style: UIAlertActionStyle.Default, handler: { action in
        
            let url = "tel://" + "+91" + self.phoneNumber;
            print(url)
            UIApplication.sharedApplication().openURL(NSURL(string: url)!)
        
        
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
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
