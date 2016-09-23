//
//  FeedTableViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 20/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import MRProgress
import Firebase
import FBSDKCoreKit
import GoogleSignIn


class FeedTableViewController: UITableViewController,GIDSignInDelegate,UITextFieldDelegate {
    
    @IBOutlet var bgImage: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet var msgField: UITextField!
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
    }
    
    var FeedData:JSON?

    override func viewDidLoad() {
        super.viewDidLoad()
        msgField.delegate = self
        let tapgestureRecogniser = UITapGestureRecognizer(target: self, action: #selector (FeedTableViewController.dismisskeyboard))
        view.addGestureRecognizer(tapgestureRecogniser)
        
        
    }
    func dismisskeyboard(){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.hidesBarsOnSwipe = true
        let button = UIBarButtonItem(image: UIImage(named:"more"), style: .Plain, target: self, action: #selector(FeedTableViewController.logout))
        self.navigationItem.rightBarButtonItem = button
        
        
        MRProgressOverlayView.showOverlayAddedTo(self.tableView, title: "Slow Day, isn't it?", mode: .IndeterminateSmallDefault, animated: true)
        
        
        getFeed()
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height));
        imageView.image = UIImage(named: "lol1");
        
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        
        visualEffectView.frame = imageView.bounds
        
        imageView.addSubview(visualEffectView);
        tableView.backgroundView = imageView
        
        self.navigationItem.title = "Live Feed"
        
        
        let user = FIRAuth.auth()?.currentUser
        let photoURL = user?.photoURL
        
        
        
        self.profileName.text = user?.displayName
        
        
        profileImage.kf_setImageWithURL(photoURL,
                                        placeholderImage: UIImage(named:"placeholder"),
                                        optionsInfo:[.Transition(ImageTransition.Fade(1))],
                                        progressBlock: { (receivedSize, totalSize) -> () in
                                            //  print("Download Progress: \(receivedSize)/\(totalSize)")
            },
                                        completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            // print("Downloaded and set!")
                                            // cell1.activity.hidden = true;
                                            
            }
        )
        
        bgImage.kf_setImageWithURL(photoURL,
                                   placeholderImage: UIImage(named:"placeholder"),
                                   optionsInfo:[.Transition(ImageTransition.Fade(1))],
                                   progressBlock: { (receivedSize, totalSize) -> () in
                                    //  print("Download Progress: \(receivedSize)/\(totalSize)")
            },
                                   completionHandler: { (image, error, cacheType, imageURL) -> () in
                                    // print("Downloaded and set!")
                                    // cell1.activity.hidden = true;
                                    
            }
        )
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = false
    }
    override func viewDidLayoutSubviews() {
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.width/2;
        self.profileImage.layer.borderColor = UIColor.whiteColor().CGColor
        self.profileImage.layer.borderWidth = 2;
        self.profileImage.layer.masksToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let some = FeedData
        {
            return some.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FeedTableViewCell
        
        if let data = FeedData
        {
            if let some = data[data.count-indexPath.row - 1]["user_name"].string
            {
                cell.nameLabel.text = some;
            }
            if let some = data[data.count-indexPath.row - 1]["user_mail"].string
            {
                cell.emailLabel.text = some
            }
            if let some = data[data.count-indexPath.row - 1]["post_text"].string
            {
                cell.messageLabel.text = some
            }
            if let some = data[data.count-indexPath.row - 1]["user_photo"].string
            {
                cell.profileImage.kf_setImageWithURL(NSURL(string: some)!,
                                               placeholderImage: UIImage(named:"placeholder"),
                                               optionsInfo:[.Transition(ImageTransition.Fade(1))],
                                               progressBlock: { (receivedSize, totalSize) -> () in
                                               // print("Download Progress: \(receivedSize)/\(totalSize)")
                    },
                                               completionHandler: { (image, error, cacheType, imageURL) -> () in
                                                
                                                cell.activity.hidden = true
                                               // print("Downloaded and set!")
                                                
                                                
                    }
                )
            }
        }

               // Configure the cell...

        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    

    func getFeed()
    {
        
        
        let url = "http://aaruush.net/AaruushFeed/get_feed.php"
        Alamofire.request(.GET, url).validate().responseJSON
            { response in
                switch response.result
                {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        self.FeedData = json
                        MRProgressOverlayView.dismissAllOverlaysForView(self.tableView, animated: true)
                        
                        self.tableView.reloadData()
                    //print(value)
                    }
                case .Failure(let error):
                    MRProgressOverlayView.dismissAllOverlaysForView(self.tableView, animated: false)
                    MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Error", mode: .Cross, animated: false)
                    print(error)
                   
                }
                
        }
        
    }
    @IBAction func postMessage(sender: AnyObject)
    {
        if(msgField.text?.characters.count == 0)
        {
            
            msgField.shake()
            
        }
        else if(msgField.text?.characters.count > 100)
        {
            
            let some = msgField.text?.characters.dropLast((msgField.text?.characters.count)! - 100)
            msgField.text = String(some!)
          
            
        }
        else if(internetCheck())
        {
            
            
            MRProgressOverlayView.showOverlayAddedTo(self.tableView, title: "Posting", mode: .IndeterminateSmallDefault, animated: true)
            
            let urlPath :String = "http://aaruush.net/AaruushFeed/add_feed.php"
            
            let user = FIRAuth.auth()?.currentUser
            
            
            let action : FIRAuthTokenCallback = {(token,error) in
                if let error = error{
                    print(error.localizedDescription)
                }
                // tok = token
                
                Alamofire.request(.POST, urlPath, parameters: ["token":token!,
                    "uid":(user?.uid)!,
                    "post_text":self.msgField.text!])
                    .response { request, response, data, error in
                        print(request)
                        print(response)
                        print(error)
                        print(data)
                        
                        if(error == nil)
                        {
                            print("Yeah")
                            self.getFeed()
                            self.msgField.text = ""
                        }
                        else
                        {
                            MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: false)
                            let alert = UIAlertController(title: "Error", message: "Could not post, please try again later", preferredStyle: UIAlertControllerStyle.Alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                            
                            
                        }
                        
                        
                }
                
                
                
            }
            FIRAuth.auth()?.currentUser?.getTokenForcingRefresh(true, completion: action)
            
            
            
            
        }
        else if(!internetCheck())
        {
            let alert = UIAlertController(title: "No Internet", message: "Make sure your device is connected to the internet for posting", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
   
        
        
       
        
        
        
        
        
     
        
    }
    
    
    func internetCheck() ->Bool
    {
        let status = Reach().connectionStatus()
        
        switch status
        {
        case .Offline:
            return false;
            
        case .Online(.WWAN):
            return true;
            
        case .Online(.WiFi):
            return true;
            
            
        default:
            return false;
            
        }
        
    }
    
    func logout()
    {
        let alert = UIAlertController(title: "Live feed", message: nil, preferredStyle: .ActionSheet)
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (UIAlertAction) in }
        let action = UIAlertAction(title:"Logout?", style: .Destructive) { (alertaction) in
            let firebaseAuth = FIRAuth.auth()
            do {
                try firebaseAuth?.signOut()
                GIDSignIn.sharedInstance().signOut()
                self.navigationController?.popViewControllerAnimated(true)
                print("is logout working?")
            } catch let signOutError as NSError {
                print ("Error signing out: \(signOutError)")
            }
        }
        alert.addAction(action)
        alert.addAction(actionCancel)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

extension UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(self.center.x - 5, self.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(self.center.x + 5, self.center.y))
        self.layer.addAnimation(animation, forKey: "position")
    }
    
}

