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
import GlitchLabel
import Firebase
import MRProgress
import GoogleSignIn
class ViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate{
    
    
    var a = 1;
    var loginManager : FBSDKLoginManager! = nil
    
    var show = "no"
    
    @IBOutlet var countDownTopConstraint: NSLayoutConstraint!
    @IBOutlet var countdownConstraint:NSLayoutConstraint!
    @IBOutlet var countdownConstraint1:NSLayoutConstraint!
    @IBOutlet var countdownConstraint2:NSLayoutConstraint!

    @IBOutlet var liveFeedButton: UIButton!
    @IBOutlet var countDown: GlitchLabel!
    @IBOutlet var aboutAaruush: UITextView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var firstLogo: LTMorphingLabel!
     @IBOutlet var secondLogo: UILabel!
     @IBOutlet var signInButton: UIButton!
    
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var exploreButton: UIButton!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "xirod", size: 18)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]

        
        
     /*   if(UIScreen.mainScreen().bounds.height >= 667.0)
        {*/
            countDown.font = UIFont(name: "xirod", size: 16)
            countDown.textAlignment = NSTextAlignment.Center
            countDown.sizeToFit()
            let date = NSDate()
        print(date)
        print("\\\\\\\\")
        
        
            
        // countDown.text = "be back next year"
        
        
        
        
        
        
          navigationController?.delegate = RZTransitionsManager.shared()
    
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
      
        
        if(UIScreen.mainScreen().bounds.height == 568 || UIScreen.mainScreen().bounds.height == 480 )
        {
            firstLogo.font = UIFont(name: "xirod", size: 15);
            secondLogo.font = UIFont(name: "xirod", size: 12);
           aboutAaruush.font =  .systemFontOfSize(14)
            
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
        applyMotionEffect(toView: liveFeedButton, mangnitude: -20)
        //-------------------parallax effect---------------------------->
}
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillAppear(animated: Bool)
    {
        loginManager = FBSDKLoginManager()
        if(UIScreen.mainScreen().bounds.height<568)
        {
            self.aboutAaruush.scrollEnabled = true
            self.countDown.hidden = true
            
        }
        
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
            self.countDown.alpha = 0.0
            self.liveFeedButton.alpha = 0.0
            show = "yes"
            firstLogo.morphingEffect = .Scale //workaround for a bug
            firstLogo.text = "Aaruush"         //because of bug, intially label is hidden, this prevents it.
        }
        
        
        
       
        
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
        
    }
    
    override func viewDidLayoutSubviews() {
        shareButton.layer.cornerRadius = 8
        shareButton.layer.borderColor = UIColor.yellowColor().CGColor
        shareButton.layer.borderWidth = 1
        exploreButton.layer.cornerRadius = 8
        exploreButton.layer.borderColor = UIColor.yellowColor().CGColor
        exploreButton.layer.borderWidth = 1
        liveFeedButton.layer.borderColor = UIColor.yellowColor().CGColor
        liveFeedButton.layer.borderWidth = 1
        liveFeedButton.layer.cornerRadius = 8
        
    }
    override func viewDidDisappear(animated: Bool) {
       // MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: false)
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
                                        self.liveFeedButton.alpha = 1.0
                                   
                                     
                                    
                                    }, completion: {(value: Bool) in
                                
                                self.countDown.alpha = 1.0})
                     })
                 })
            })
 
        //-------------------animations---------------------------->
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
       // let vc = segue.destinationViewController;
        
        let backButton = UIBarButtonItem()
        backButton.title = "";
        self.navigationItem.backBarButtonItem = backButton
        
        if(segue.identifier == "feed")
        {
            MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:FeedTableViewController.self,
                                                                  forAction:.PushPop)
            
        }
        else if(segue.identifier == "explore")
        {
            MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
        RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                              fromViewController:self.dynamicType,
                                                              toViewController:MainMenuViewController.self,
                                                              forAction:.PushPop)
        }
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
        if let link = NSURL(string: "https://appsto.re/in/OqGZeb.i")
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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func goToLiveFeed(sender: AnyObject) {
        if(FIRAuth.auth()?.currentUser != nil){
            self.performSegueWithIdentifier("feed",sender:self)
        }
        else{
        let alertController = UIAlertController(title: "Signin using...", message: nil, preferredStyle:.ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in }
        let googleSignin = UIAlertAction(title: "Google", style: .Default) { (UIAlertAction) in
            MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Please wait while we test your patience", mode: .IndeterminateSmallDefault, animated: true)
            GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
            GIDSignIn.sharedInstance().delegate = self
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()
            print("from google")
            }
        let facebookLogin = UIAlertAction(title: "Facebook", style: .Default) { (AlertAction) in
                MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Please wait while we test your patience", mode: .IndeterminateSmallDefault, animated: true)
                self.loginManager.logInWithReadPermissions(["email"], fromViewController: self, handler: { (result, error) in
                    print("ho rha hai kya?")
                    if let error = error {
                        print(error.localizedDescription)
                        print("for facebook")
                    } else if(result.isCancelled) {
                        MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                        let alert = UIAlertController(title: "Error", message: "FBLogin cancelled", preferredStyle: .Alert)
                        let action = UIAlertAction(title: "Ok", style: .Default, handler: { (UIAlertAction) in })
                        alert.addAction(action)
                        self.presentViewController(alert, animated: true, completion: nil)
                        print("FBLogin cancelled")
                    } else {
                        // [START headless_facebook_auth]
                        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                        
                        // [END headless_facebook_auth]
                        self.firebaseLogin(credential)
                        print("from facebook")
                    }
                })
        }
        alertController.addAction(cancelAction)
        alertController.addAction(googleSignin)
        alertController.addAction(facebookLogin)
        self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    // [START headless_google_auth]
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError?) {
        if let error = error {
            print(error.localizedDescription)
            print("sign in localised")
            MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: { (UIAlertAction) in })
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken,
                                                                     accessToken: authentication.accessToken)
        // [START_EXCLUDE]
        firebaseLogin(credential)
        print("sign in other")
        // [END_EXCLUDE]
    }
    // [END headless_google_auth]
    func firebaseLogin(credential: FIRAuthCredential) {
            if let user = FIRAuth.auth()?.currentUser {
                // [START link_credential]
                user.linkWithCredential(credential) { (user, error) in
                    // [START_EXCLUDE]

                        if let error = error {
                            print(error.localizedDescription)
                            print("fir localised")
                            MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
                            let action = UIAlertAction(title: "Ok", style: .Default, handler: { (UIAlertAction) in })
                            alert.addAction(action)
                            self.presentViewController(alert, animated: true, completion: nil)
                            return
                        }
                    print("fir other")
                    self.performSegueWithIdentifier("feed", sender: self)
                
                    // [END_EXCLUDE]
                }
                // [END link_credential]
            } else {
                // [START signin_credential]
                FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                    // [START_EXCLUDE]
                        if let error = error {
                            print(error.localizedDescription)
                            print("fir localised 2")
                            MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                            let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)\nTry other login", preferredStyle: .Alert)
                            let action = UIAlertAction(title: "Ok", style: .Default, handler: { (UIAlertAction) in })
                            alert.addAction(action)
                            self.presentViewController(alert, animated: true, completion: nil)
                            return
                        }
                    // [END_EXCLUDE]
                    print("fir other 2")
                    self.performSegueWithIdentifier("feed", sender: self)
                }
                // [END signin_credential]
            }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
    }
}

