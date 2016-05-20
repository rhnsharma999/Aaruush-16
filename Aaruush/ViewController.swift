//
//  ViewController.swift
//  Aarush
//
//  Created by Rohan Lokesh Sharma on 16/05/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import StarWars

class ViewController: UIViewController,UIViewControllerTransitioningDelegate{
    
    var a = 1;
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var firstLogo: UILabel!
     @IBOutlet var secondLogo: UILabel!
     @IBOutlet var signInButton: UIButton!
    override func viewDidLoad() {
        
        signInButton.layer.borderWidth = 2;
        signInButton.layer.borderColor = UIColor.yellowColor().CGColor
        signInButton.layer.cornerRadius = 10;
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillAppear(animated: Bool)
    {
        
    
        imageView.alpha = 0.0;
        firstLogo.alpha = 0.0;
        secondLogo.alpha = 0.0;
        signInButton.alpha = 0.0;
        
        
        
       
        
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
                                    
                                    self.signInButton.alpha = 1.0
                                     
                                    
                                }, completion: nil)
                     })
                 })
            })
 
    }
   
  
    @IBAction func signIn(sender: AnyObject) {
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: [], animations: {self.signInButton.backgroundColor = UIColor.yellowColor()}, completion: nil)
        
        UIView.animateWithDuration(0.1, delay: 0.1, options: [], animations: {self.signInButton.backgroundColor = UIColor.clearColor()}, completion: {(value :Bool) in
            
            self.performSegueWithIdentifier("login", sender: self)
        
        
        })
        
        
    }
    
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let vc = segue.destinationViewController;
        vc.transitioningDelegate = self;
        
        
        
    }
    
     func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return StarWarsGLAnimator()
    }

   

    //func animationControllerForPresentedController(presented: UIViewController, presentingController presenting:
}

