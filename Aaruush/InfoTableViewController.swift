//
//  InfoTableViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 14/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController,iCarouselDataSource,iCarouselDelegate {

    @IBOutlet var myCarousel: iCarousel!
    override func viewDidLoad()
    {
        
        myCarousel.dataSource = self;
        myCarousel.delegate = self;
        myCarousel.type = .CoverFlow
        myCarousel.backgroundColor = .clearColor()
        myCarousel.pagingEnabled = true;
        myCarousel.contentMode = .ScaleAspectFill
        
        
        //<-----DANGER DO NOT TOUCH THIS STUFF OR THE APP LOOKS UGLY--->
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height));
        imageView.image = UIImage(named: "lol1");
        
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        
        visualEffectView.frame = imageView.bounds
        
        imageView.addSubview(visualEffectView);
        tableView.backgroundView = imageView
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        //<-----DANGER DO NOT TOUCH THIS STUFF OR THE APP LOOKS UGLY--->
        super.viewDidLoad()

   
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
       if(indexPath.section==0)
       {
         cell.details.text = "Some random shit Some random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shitSome random shit"
        }
        else
       {
         cell.details.text = "Some rand"
        }
        
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
        
        headerCell.title.text = "Some"
        headerCell.title.textColor = .whiteColor()
        headerCell.backgroundColor = UIColor.clearColor()
        
        return headerCell;
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return 5;
        
    }
    
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.myCarousel.center.x, self.myCarousel.center.y, self.view.bounds.width - 100, 200));
        myView.image = UIImage(named: "placeholder");
        return myView
    }

}
