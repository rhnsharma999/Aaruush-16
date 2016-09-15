//
//  InfoTableViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 14/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import SwiftyJSON
class InfoTableViewController: UITableViewController,iCarouselDataSource,iCarouselDelegate {
    
    @IBOutlet var goBackButton: UIButton!
    

    
    var receivedData = [String]()
    var allData: JSON?
    var recImage:String?
    
    @IBOutlet var myCarousel: iCarousel!
    override func viewDidLoad()
    {
        if(!receivedData.isEmpty)
        {
            receivedData = receivedData.sort()
            
        }
        myCarousel.dataSource = self;
        myCarousel.delegate = self;
        myCarousel.type = .CoverFlow
        myCarousel.backgroundColor = .clearColor()
        myCarousel.pagingEnabled = true;
        myCarousel.contentMode = .ScaleAspectFill
        
        
        //<-----DANGER DO NOT TOUCH THIS STUFF OR THE APP LOOKS UGLY--->
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height));
        imageView.image = UIImage(named: "lol1");
        
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        
        visualEffectView.frame = imageView.bounds
        
        imageView.addSubview(visualEffectView);
        tableView.backgroundView = imageView
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        //<-----DANGER DO NOT TOUCH THIS STUFF OR THE APP LOOKS UGLY--->
        super.viewDidLoad()

   
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
    
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! detailTableViewCell
        
        
        cell.details.scrollEnabled = false;
        var data = "";
        var title = ""
        
        if(!receivedData.isEmpty)
        {
            title = receivedData[myCarousel.currentItemIndex]
        }
        
        
        
        
        if(allData != nil)
        {
            switch indexPath.section {
            case 0:
                data = title;
            case 1:
                data = allData![title]["desc"].string!
            case 2:
                data = allData![title]["rounds"].string!
            case 3:
                data = allData![title]["coords"].string!
            case 4:
                data = allData![title]["rules"].string!
                
            default:
                data = ""
            }
            
        }
       
        data = removeTags(data)
        
        cell.details.text = data;
        
        cell.backgroundColor = UIColor.clearColor();
        cell.details.textColor = UIColor.whiteColor();
        cell.details.backgroundColor = UIColor.clearColor();
     
       
      
        
        
        
        

        // Configure the cell...

        return cell
    }
    
  /*  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        var title = "";
        
        
        switch section {
        case 0:
            title = "Name"
        case 1:
            title = "Some other"
        default:
            "default"
        }
        
        return title
        
    }
    */
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("cell1") as! headerTableViewCell
        
        
        var headTitle = "";
        
        switch section {
        case 0:
            headTitle = "Event"
        case 1:
            headTitle = "Description"
        case 2:
            headTitle = "Rounds"
        case 3:
            headTitle = "Co-Ordinators"
        case 4:
            headTitle = "Rules"
            
        default:
            headTitle = "Info"
        }
        
        
        
        headerCell.title.text = headTitle
        headerCell.title.textColor = .whiteColor()
        headerCell.backgroundColor = UIColor.grayColor()
        //headerCell.backgroundView?.alpha = 0.5
        
        return headerCell;
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return receivedData.count
        
    }
    
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.myCarousel.center.x, self.myCarousel.center.y, self.view.bounds.width - 100, 200));
        myView.image = UIImage(named: recImage!);
        
        return myView
        
    }

    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        self.tableView.reloadData()
    }
    
    func removeTags(inputString: String) -> String
    {
        return inputString.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "\n", options: .RegularExpressionSearch, range: nil)
    }

    @IBAction func goBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func prefersStatusBarHidden() -> Bool {
        return true;
        
    }
}
