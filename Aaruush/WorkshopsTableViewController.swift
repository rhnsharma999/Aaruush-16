//
//  WorkshopsTableViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 15/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher
class WorkshopsTableViewController: UITableViewController,iCarouselDataSource,iCarouselDelegate {
    
    @IBOutlet var myCarousel: iCarousel!
    
   

    var global_data:JSON?
    var titles = [String]()
    
    override func viewDidLoad() {
        
        generateTitle()
        super.viewDidLoad()
        
        
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


    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = true;
        
        self.navigationController?.navigationBar.hidden = false;
        self.navigationController?.navigationBar.translucent = true
        self.navigationItem.title = "Workshops"
        
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
        self.navigationController?.hidesBarsOnSwipe = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 8
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! detailTableViewCell
        
        cell.details.scrollEnabled = false;
        var title = ""
        
        
        if(global_data != nil)
        {
            title = titles[myCarousel.currentItemIndex];
            
        }
        var data = ""
        
        
       if let json = global_data
       {
            switch indexPath.section {
            case 0:
                data = title
            case 1:
                if let some = json[title]["description"].string
                {
                    data = some;
                    
                }
            case 2:
                if let some = json[title]["team"].string
                {
                    data = some;
                    
                }
            case 3:
                if let some = json[title]["date"].string
                {
                    data = some;
                    data = dateFix(data)
                    
                    
                }
            case 4:
                if let some = json[title]["cost"].string
                {
                    data = some;
                    
                }
            case 5:
                if let some = json[title]["time"].string
                {
                    data = some;
                    
                }
            case 6:
                if let some = json[title]["company_name"].string
                {
                    data = some;
                    
                }
            case 7:
                if let some = json[title]["coords"].string
                {
                    data = some;
                    
                }
            default:
                data = "";
            
        }
        
       }

   
        data = removeTags(data)
        
        
        
        cell.details.text = data;
        if(indexPath.section==0)
        {
            cell.details.font = UIFont(name: "xirod", size: 22)
            cell.details.textAlignment = NSTextAlignment.Center
        }
        else
        {
            cell.details.font = .systemFontOfSize(17)
            
        }
        
        cell.backgroundColor = UIColor.clearColor();
        cell.details.textColor = UIColor.whiteColor();
        cell.details.backgroundColor = UIColor.clearColor();
        cell.contentView.backgroundColor = UIColor.clearColor()
        cell.details.textAlignment = NSTextAlignment.Center
        
       
        return cell
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCellWithIdentifier("cell1") as! headerTableViewCell
        
        
        var headTitle = "";
        
        switch section {
        case 0:
            headTitle = "Event"
        case 1:
            headTitle = "Description"
        case 2:
            headTitle = "Team"
        case 3:
            headTitle = "Date"
        case 4:
            headTitle = "Cost"
        case 5:
            headTitle = "Time"
        case 6:
            headTitle = "Company Name"
        case 7:
            headTitle = "Co-Ordinators"
       
        default:
            headTitle = "Info"
        }
        
        
        
        headerCell.title.text = headTitle
        headerCell.title.textColor = .whiteColor()
        headerCell.backgroundColor = UIColor.grayColor()
        
        //headerCell.backgroundView?.alpha = 0.5
        
        if(section==0)
        {
            headerCell.hidden = true;
            
            
        }
        return headerCell;
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return titles.count
        
    }
    
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.myCarousel.center.x, self.myCarousel.center.y, self.view.bounds.width - 100, 200));
        
        myView.image = UIImage(named: "placeholder");
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        myView.addSubview(activity);
        activity.startAnimating();
        activity.center.x = myView.bounds.width/2;
        activity.center.y = myView.bounds.height/2
        
        var url = ""
        if let some = global_data
        {
            if let url1 = some[titles[index]]["imgSource"].string
            {
                url = Reusable.IMAGES + "workshop/" + url1;
                
            }
            
        }
        
        
        url = removeSpaces(url)
      
        
        print(url)
        myView.kf_setImageWithURL(NSURL(string: url),
                                  placeholderImage: UIImage(named:"placeholder"),
                                  optionsInfo: nil,
                                  progressBlock: { (receivedSize, totalSize) -> () in
                                   // print("Download Progress: \(receivedSize)/\(totalSize)")
            },
                                  completionHandler: { (image, error, cacheType, imageURL) -> () in
                                    // print("Downloaded and set!")
                                    
                                    activity.hidden = true;
                                    
            }
        )
        
        
        
        
        return myView
        
    }
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        
        
        
        
        
        
        self.tableView.reloadData()
    }

    func removeTags(inputString: String) -> String
    {
        return inputString.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "\n", options: .RegularExpressionSearch, range: nil)
    }
    
    func generateTitle()
    {
        
        
        
        if let something = global_data
        {
            for(key,_):(String,JSON) in something
            {
                self.titles.append(key)
            }
            self.myCarousel.reloadData();
            self.tableView.reloadData();
            
        }
    
        self.titles = self.titles.sort()
        
    }
    
    func removeSpaces(url:String) -> String
    {
        
        return url.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: .RegularExpressionSearch, range: nil)
        
    }
    func dateFix(inputString:String) -> String{
        
        var other = inputString.stringByReplacingOccurrencesOfString("<sup>", withString: "", options: .RegularExpressionSearch, range: nil)
        
        other = other.stringByReplacingOccurrencesOfString("</sup>", withString: "", options: .RegularExpressionSearch, range: nil)
        
        return other;
        
    }
    
   override func prefersStatusBarHidden() -> Bool {
        return true;
        
    }

    @IBAction func goBack(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
