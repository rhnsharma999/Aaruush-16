//
//  baseViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 20/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import PageMenu

class baseViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    
    var controllerArray : [UIViewController] = []
    

    override func viewDidLoad() {
        
        
      
     //   let controller : UITableViewController = UITableViewController(nibName: "EventsTableViewController", bundle: nil);
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        var viewcontroller:UIViewController = storyboard.instantiateViewControllerWithIdentifier("oneView");
        var viewCon:UIViewController = storyboard.instantiateViewControllerWithIdentifier("twoView");
        
        
        
        viewcontroller.title = "SAMPLE TITLE"
        viewCon.title = "Second View"
        controllerArray.append(viewcontroller)
        controllerArray.append(viewCon)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(4.3),
            .UseMenuLikeSegmentedControl(true),
            .MenuItemSeparatorPercentageHeight(0.1),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .ViewBackgroundColor(UIColor.blackColor())
            
            
        ]
        
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height+100), pageMenuOptions: parameters)
        
       // CAPSPageMenuOption.SelectedMenuItemLabelColor(UIColor.orangeColor())
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        
        
        
        
        
        
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

}
