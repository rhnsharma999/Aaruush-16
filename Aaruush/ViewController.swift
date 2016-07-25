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

class ViewController: UIViewController,UIViewControllerTransitioningDelegate,FBSDKLoginButtonDelegate{
    
    
    var a = 1;
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var firstLogo: LTMorphingLabel!
     @IBOutlet var secondLogo: UILabel!
     @IBOutlet var signInButton: UIButton!
    override func viewDidLoad() {
        
        
        
        //rounded edges
        signInButton.layer.borderWidth = 2;
        signInButton.layer.borderColor = UIColor.yellowColor().CGColor
        signInButton.layer.cornerRadius = 10;
        
          
        
        
        super.viewDidLoad()
        
        if (FBSDKAccessToken.currentAccessToken() == nil)
        {
            print("not logged in...")
        }
        else
        {
            self.performSegueWithIdentifier("toLogin", sender: self);
            
            
            print("logged in...")
        }
       
}
    
    // MARK: - Facebook login methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil{
            print("login complete...")
            self.performSegueWithIdentifier("toLogin", sender: self)


        }
        else{
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user logged out...")
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.hidden = true;
        
    //making all elements transparent so that they are hidden.
        imageView.alpha = 0.0;
        firstLogo.alpha = 0.0;
        secondLogo.alpha = 0.0;
        signInButton.alpha = 0.0;
        
        
        firstLogo.morphingEffect = .Scale //workaround for a bug
       firstLogo.text = "Aaruush"         //because of bug, intially label is hidden, this prevents it.
        
    }
    override func viewDidDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
    }
    override func viewDidAppear(animated: Bool)
    {
        
       
        
       
       
        
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
                                    self.signInButton.alpha = 1.0
                                     
                                    
                                }, completion: nil)
                     })
                 })
            })
 
    }
   
  
    @IBAction func signIn(sender: AnyObject)
    {
        
      UIView.animateWithDuration(0.1, delay: 0.0, options: [], animations: {self.signInButton.backgroundColor = UIColor.yellowColor()}, completion: nil)
    UIView.animateWithDuration(0.1, delay: 0.1, options: [], animations: {self.signInButton.backgroundColor = UIColor.clearColor()}, completion: {(value :Bool) in})
        
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["email","public_profile","user_friends"], fromViewController: self) { (result, error) -> Void in
            if (error == nil)
            {
                self.performSegueWithIdentifier("toLogin", sender: self);
                
                let fbloginresult : FBSDKLoginManagerLoginResult = result
               /* if(fbloginresult.grantedPermissions.contains("email"))
                {
                    
                }*/
            }
            else
            {
                print("error");
                
            }
        }
       

    }
    
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let vc = segue.destinationViewController;
        vc.transitioningDelegate = self; //for fallapart dismiss transition
        
        
        
        
        
    }
    
     func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return StarWarsGLAnimator()
    }

   

    //func animationControllerForPresentedController(presented: UIViewController, presentingController presenting:
}

