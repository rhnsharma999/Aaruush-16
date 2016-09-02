//
//  AaruushViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import RZTransitions
import FBSDKLoginKit

class AaruushViewController: UIViewController {
 
    
    @IBOutlet var aboutInfo: UITextView!
    @IBOutlet var aaruushLogo: UILabel!
    @IBOutlet var towardsInfinity:UILabel!
    
    var gesture:UISwipeGestureRecognizer!
    

    override func viewDidLoad() {
        
        
        aaruushLogo.font = UIFont(name: "xirod", size: 25)
        towardsInfinity.font = UIFont(name: "xirod", size: 15)
        
        aboutInfo.alpha = 0.0
        
        super.viewDidLoad()
      
         self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
     
        
        gesture = UISwipeGestureRecognizer(target: self, action: #selector(AaruushViewController.doSegue))
        gesture.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(gesture)

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
    
    @IBAction func goToMenu(sender: AnyObject) {
        
        navigationController?.delegate = RZTransitionsManager.shared()
        
        RZTransitionsManager.shared().defaultPresentDismissAnimationController = RZZoomAlphaAnimationController()
        RZTransitionsManager.shared().defaultPushPopAnimationController = RZCardSlideAnimationController()
        
        
        self.performSegueWithIdentifier("someSegue", sender: self)
    }
    
    
    func doSegue()
    {
        navigationController?.delegate = RZTransitionsManager.shared()
        
        RZTransitionsManager.shared().defaultPresentDismissAnimationController = RZZoomAlphaAnimationController()
        RZTransitionsManager.shared().defaultPushPopAnimationController = RZCardSlideAnimationController()
        
        
        self.performSegueWithIdentifier("someSegue", sender:self)
    }
    
    @IBAction func showAbout(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: {
            
           if(self.aboutInfo.alpha==1.0)
           {
            self.aboutInfo.alpha=0.0
            }
            else
           {
             self.aboutInfo.alpha=1.0
            
            }
            
            
            }, completion: nil);
        
    }
    
    @IBAction func Logout(sender: AnyObject) {
        print("user logged out...")
        let loginManager : FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        dismissViewControllerAnimated(true, completion: nil)
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
