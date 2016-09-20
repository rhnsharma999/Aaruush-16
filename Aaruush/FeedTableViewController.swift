//
//  FeedTableViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 20/09/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import MRProgress


class FeedTableViewController: UITableViewController {
    
    var FeedData:JSON?

    override func viewDidLoad() {
        
        MRProgressOverlayView.showOverlayAddedTo(self.tableView, title: "Slow Day, isn't it?", mode: .IndeterminateSmallDefault, animated: true)
        
        
        getFeed()
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height));
        imageView.image = UIImage(named: "lol1");
        
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        
        visualEffectView.frame = imageView.bounds
        
        imageView.addSubview(visualEffectView);
        tableView.backgroundView = imageView
        
        self.navigationItem.title = "Live Feed"
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let some = FeedData
        {
            return some.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! FeedTableViewCell
        
        if let data = FeedData
        {
            if let some = data[data.count-indexPath.row - 1]["user_name"].string
            {
                cell.nameLabel.text = some;
            }
            if let some = data[data.count-indexPath.row - 1]["user_mail"].string
            {
                cell.emailLabel.text = some
            }
            if let some = data[data.count-indexPath.row - 1]["post_text"].string
            {
                cell.messageLabel.text = some
            }
            if let some = data[data.count-indexPath.row - 1]["user_photo"].string
            {
                cell.profileImage.kf_setImageWithURL(NSURL(string: some)!,
                                               placeholderImage: UIImage(named:"placeholder"),
                                               optionsInfo:[.Transition(ImageTransition.Fade(1))],
                                               progressBlock: { (receivedSize, totalSize) -> () in
                                               // print("Download Progress: \(receivedSize)/\(totalSize)")
                    },
                                               completionHandler: { (image, error, cacheType, imageURL) -> () in
                                                
                                                cell.activity.hidden = true
                                               // print("Downloaded and set!")
                                                
                                                
                    }
                )
            }
        }

               // Configure the cell...

        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    

    func getFeed()
    {
        
        
        let url = "http://aaruush.net/AaruushFeed/get_feed.php"
        Alamofire.request(.GET, url).validate().responseJSON
            { response in
                switch response.result
                {
                case .Success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        self.FeedData = json
                        print("JSON: \(json)")
                        MRProgressOverlayView.dismissAllOverlaysForView(self.tableView, animated: true)
                        
                        self.tableView.reloadData()
                    print(value)
                    }
                case .Failure(let error):
                    MRProgressOverlayView.dismissAllOverlaysForView(self.tableView, animated: false)
                    MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Error", mode: .Cross, animated: false)
                    print(error)
                   
                }
                
        }
        
        
    }
}
