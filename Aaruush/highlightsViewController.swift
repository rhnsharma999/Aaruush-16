//
//  highlightsViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 15/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class highlightsViewController: UIViewController {

    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    override func viewDidLoad() {
        
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(highlightsViewController.didTap))
        
        self.firstImage.addGestureRecognizer(gesture)
        
        self.view.backgroundColor = UIColor.blackColor()
        self.navigationItem.title = "Highlights"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    func didTap()
    {
        UIView.animateWithDuration(1.0, animations: {
            
            
            self.firstImage.transform = CGAffineTransformMakeScale(1.5, 1.5)
            
            }, completion: {(value:Bool) in
        
        
                self.firstImage.transform = CGAffineTransformIdentity
        
        })
    
    }
}
