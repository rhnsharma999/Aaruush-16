//
//  SecondViewController.swift
//  Aarush
//
//  Created by Rohan Lokesh Sharma on 19/05/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var balloon1:UIImageView!
//    @IBOutlet var balloon2:UIImageView!
    @IBOutlet var balloon3:UIImageView!
    
    @IBOutlet var smallBalloon1:UIImageView!
    @IBOutlet var smallBalloon2:UIImageView!
    
    @IBOutlet var cloud1:UIImageView!;
    @IBOutlet var cloud2:UIImageView!;
    @IBOutlet var cloud3:UIImageView!;
    @IBOutlet var cloud4:UIImageView!;
    

    @IBOutlet var sunImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
  
        
        balloon1.alpha = 0.0
      
        balloon3.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
      
        
        
        //--------------animations-------------------->
        
    
        UIView.animateWithDuration(20, delay: 0.5, options: [.Repeat,.Autoreverse], animations: {
            
            self.cloud1.center.x += 30
            self.cloud2.center.x += 30
            self.cloud3.center.x += 30
            self.cloud4.center.x += 30
            
            
            }, completion: nil);
        
        
        
        
        UIView.animateWithDuration(15, delay: 0.0, options: [.Repeat,.CurveLinear], animations: {
            
            self.sunImage.transform = CGAffineTransformMakeRotation((360.0 * CGFloat(M_PI)) / 360.0)
            
            
            }, completion: nil)
        
        
        
        UIView.animateWithDuration(3, delay: 0.0, options: [.Autoreverse,.Repeat], animations: {
            self.smallBalloon1.center.y += 20;
            
            
            }, completion: nil)
        
        UIView.animateWithDuration(3, delay: 0.0, options: [.Autoreverse,.Repeat], animations: {
            self.smallBalloon2.center.y += 20;
            
            
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.5, delay: 0.5, options: [], animations:
            {
            
            self.balloon1.alpha = 1.0
          //  self.balloon2.alpha = 1.0
            self.balloon3.alpha = 1.0

            }, completion: { (value: Bool) in

                UIView.animateWithDuration(3, delay: 0.0, options: [.Autoreverse,.Repeat], animations: {
                    
                    self.balloon1.center.y += 20;
            //        self.balloon2.center.y += 20;
                    self.balloon3.center.y += 20;
                    
                    }, completion: nil)
        })
        
        
        //--------------end animations-------------------->
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
       // self.navigationController?.popViewControllerAnimated(true);
        
    
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
