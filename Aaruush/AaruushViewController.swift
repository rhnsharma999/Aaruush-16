//
//  AaruushViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import RZTransitions

class AaruushViewController: UIViewController {
    
    var gesture:UISwipeGestureRecognizer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackOpaque;
        
        gesture = UISwipeGestureRecognizer(target: self, action: #selector(AaruushViewController.doSegue))
        gesture.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(gesture)

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
