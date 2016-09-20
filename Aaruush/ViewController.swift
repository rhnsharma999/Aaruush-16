//
//  ViewController.swift
//  Aarush
//
//  Created by Rohan Lokesh Sharma on 16/05/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import StarWars
import LTMorphingLabel
import RZTransitions
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate{
    
    
    var a = 1;
    
    var show = "no"
    
    
    @IBOutlet var aboutAaruush: UITextView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var firstLogo: LTMorphingLabel!
     @IBOutlet var secondLogo: UILabel!
     @IBOutlet var signInButton: UIButton!
    
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var exploreButton: UIButton!
    var facebookString = ""
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        navigationController?.delegate = RZTransitionsManager.shared()
      //  signInButton.hidden = true;
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
        if(UIScreen.mainScreen().bounds.height == 568 || UIScreen.mainScreen().bounds.height == 480 )
        {
            firstLogo.font = UIFont(name: "xirod", size: 15);
            secondLogo.font = UIFont(name: "xirod", size: 12);
           aboutAaruush.font =  .systemFontOfSize(14)
            
        }
        if(FBSDKAccessToken.currentAccessToken() != nil){
            self.performSegueWithIdentifier("toLogin", sender: self)
        }
        
        
        
        //rounded edges
    //    signInButton.layer.borderWidth = 2;
    //    signInButton.layer.borderColor = UIColor.yellowColor().CGColor
    //    signInButton.layer.cornerRadius = 10;
        // added parallax effect here
        
        //-------------------parallax effect---------------------------->
        applyMotionEffect(toView: self.view, mangnitude: 10)
        applyMotionEffect(toView: imageView, mangnitude: -20)
        applyMotionEffect(toView: firstLogo, mangnitude: -20)
        applyMotionEffect(toView: secondLogo, mangnitude: -20)
        applyMotionEffect(toView: aboutAaruush, mangnitude: -20)
        applyMotionEffect(toView: shareButton, mangnitude: -20)
        applyMotionEffect(toView: exploreButton, mangnitude: -20)
        //-------------------parallax effect---------------------------->
}
    
    
// MARK:  Facebook login methods
    
 /*   func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(facebookString == ""){
            
        }
        else{
            FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
                
                let strFirstName: String = (result.objectForKey("first_name") as? String)!
                let strLastName: String = (result.objectForKey("last_name") as? String)!
                self.facebookString = "Welcome, \(strFirstName) \(strLastName)"
            }
        }
    }*/
    
 /*   func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
       
    }
    */
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.hidden = true;
        
    //making all elements transparent so that they are hidden.
        if(show=="no")
        {
            imageView.alpha = 0.0;
            firstLogo.alpha = 0.0;
            secondLogo.alpha = 0.0;
            //   signInButton.alpha = 0.0;
            aboutAaruush.alpha = 0.0;
            self.shareButton.alpha = 0.0
            self.exploreButton.alpha = 0.0
            show = "yes"
        }
        
        
        
        firstLogo.morphingEffect = .Scale //workaround for a bug
       firstLogo.text = "Aaruush"         //because of bug, intially label is hidden, this prevents it.
        
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
    }
    override func viewDidAppear(animated: Bool)
    {
        
       
        
       
       
        //-------------------animations ---------------------------->
        UIView.animateWithDuration(0.5, delay: 0.5, options: [.CurveEaseOut], animations: {
            
           self.imageView.alpha = 1.0
            
            }, completion:
            
            { (value: Bool) in
                
                
                UIView.animateWithDuration(0.5, delay: 0.0, options: [.CurveEaseOut], animations: {
                    
                    self.firstLogo.alpha = 1.0
                   
                    
                    }, completion:
                    
                    { (value: Bool) in
                        
                        UIView.animateWithDuration(0.5, delay: 0.0, options: [.CurveEaseOut], animations: {
                            
                            self.secondLogo.alpha = 1.0
                            
                            }, completion:
                            
                            { (value: Bool) in
                                
                                UIView.animateWithDuration(0.5, delay: 0.0, options: [.CurveEaseOut], animations:
                                    {
                                        
                                        self.firstLogo.morphingEffect = .Anvil
                                        
                                        self.firstLogo.text = "Aaruush 10th Edition"
                                    self.aboutAaruush.alpha = 1.0
                                        self.shareButton.alpha = 1.0
                                        self.exploreButton.alpha = 1.0
                                     
                                    
                                }, completion: nil)
                     })
                 })
            })
 
        //-------------------animations---------------------------->
    }
   
  
    @IBAction func signIn(sender: AnyObject)
    {
        
    //  UIView.animateWithDuration(0.1, delay: 0.0, options: [], animations: {self.signInButton.backgroundColor = UIColor.yellowColor()}, completion: nil)
    UIView.animateWithDuration(0.1, delay: 0.1, options: [], animations: {self.signInButton.backgroundColor = UIColor.clearColor()}, completion: {(value :Bool) in})
        if(FBSDKAccessToken.currentAccessToken() != nil){
            performSegueWithIdentifier("toLogin", sender: self)
        }
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["email","public_profile","user_friends"], fromViewController: self) { (result, error) -> Void in
            if(FBSDKAccessToken.currentAccessToken() == nil){
                let alert = UIAlertController(title: "Invalid Credentials!", message: "You must log in to proceed.", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Cancel ) { _ in })
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else{
                self.performSegueWithIdentifier("toLogin", sender: self);
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                print(fbloginresult)
            }
        }
    }
    
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let vc = segue.destinationViewController;
        
        let backButton = UIBarButtonItem()
        backButton.title = "";
        self.navigationItem.backBarButtonItem = backButton
        
        RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                              fromViewController:self.dynamicType,
                                                              toViewController:MainMenuViewController.self,
                                                              forAction:.PushPop)
        
        
       // vc.transitioningDelegate = self; //for fallapart dismiss transition
        
        
        
        
        
    }
    
     func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return StarWarsGLAnimator()
    }

    
    func applyMotionEffect(toView view:UIView,mangnitude:Float) //function for reusability parallax effect
    {
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis);
        xMotion.minimumRelativeValue = -mangnitude
        xMotion.maximumRelativeValue = mangnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -mangnitude
        yMotion.maximumRelativeValue = mangnitude
        
        
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion,yMotion];
        view.addMotionEffect(group)
        
    }
    
    
    @IBAction func shareAaruush(sender: AnyObject) {
        
        let message = "Check out Aaruush 16, SRM University"
        //Set the link to share.
        if let link = NSURL(string: "http://www.aaruush.net/")
        {
            let objectsToShare = [message,link]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList]
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func goForwaard(sender: AnyObject) {
        performSegueWithIdentifier("explore", sender: self);
        
    }
    
}

