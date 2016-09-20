//
//  WorkshopsViewController.swift
//  Aaruush
//
//  Created by HARSH SAXENA on 25/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MRProgress
import Kingfisher


class WorkshopsViewController: UIViewController,iCarouselDelegate,iCarouselDataSource {
    
    
    
    //<--------------------------NEtwork data------------------------------->
  
     var global_json:JSON?
    var titles = [String]()
    //<--------------------------NEtwork data------------------------------->
    
    
    
    //dummy data, will change later
    let data = ["accelerobotics","application_of_gis","entreprenuer_and_business_plan","hacktrack","motor_bike_overhauling","rc_cars","trancebotics","wireless_sensor_networks"]
    
    @IBOutlet var backgroundForCarousel: UIImageView!
    @IBOutlet weak var workshopCarousel: iCarousel!
    
    @IBOutlet weak var workshopLabel: UILabel!

    @IBOutlet weak var workshopInfo: UITextView!
    
    @IBOutlet var backButton: UIButton!
    @IBAction func goBack(sender: UIButton) {
        //self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func nsAttributedString(string : String) -> NSMutableAttributedString! {
        var attributedString : NSMutableAttributedString = NSMutableAttributedString()
        do{
            attributedString =  try NSMutableAttributedString(data: string.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType], documentAttributes: nil)
            attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0,length: attributedString.length))
            
        }
        catch{
        }
        
        return attributedString
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true;
        
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
    }
    
    
    
    override func viewDidLoad() {
        
    
        
        
      
       
        if(UIScreen.mainScreen().bounds.height == 568 || UIScreen.mainScreen().bounds.height == 480)
        {
            self.workshopInfo.font = .systemFontOfSize(13)
        }
        
        
        if(global_json != nil)
        {
            getData()
        }
        
        
        
        super.viewDidLoad()
        if(UIScreen.mainScreen().bounds.height == 568 || UIScreen.mainScreen().bounds.height == 480 )
        {
            self.workshopLabel.font = .systemFontOfSize(13)
        }
        
        workshopCarousel.dataSource = self
        workshopCarousel.delegate = self
        workshopCarousel.type = .CoverFlow
        workshopCarousel.backgroundColor = UIColor.clearColor()
        workshopCarousel.pagingEnabled = true
        workshopCarousel.contentMode = .ScaleAspectFill
    }
    
    override func viewDidLayoutSubviews() {
        self.backButton.center.x = self.view.bounds.width/2
        self.backButton.layer.cornerRadius = self.backButton.bounds.width/2
    }
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return titles.count
        
    }
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.workshopCarousel.center.x, self.workshopCarousel.center.y, self.view.bounds.width - 100, 200))

        
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        myView.addSubview(activity);
        activity.startAnimating();
        activity.center.x = myView.bounds.width/2;
        activity.center.y = myView.bounds.height/2
        
        
        let url = "http://aaruush.net/images/workshop/" + global_json![titles[index]]["imgSource"].string!
        
        
        
        myView.kf_setImageWithURL(NSURL(string: url),
                                        placeholderImage: UIImage(named:"placeholder"),
                                        optionsInfo: nil,
                                        progressBlock: { (receivedSize, totalSize) -> () in
                                            print("Download Progress: \(receivedSize)/\(totalSize)")
            },
                                        completionHandler: { (image, error, cacheType, imageURL) -> () in
                                           // print("Downloaded and set!")
                                            activity.hidden = true;
                                            
            }
        )
        
      //  myView.load(url)
      
        
        
        
        
        
        
        return myView
    }
    
    
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        
        var localWorkshopInfo = ""
        
        if(global_json != nil)
        {
            let heading = titles[carousel.currentItemIndex]
            workshopLabel.text = heading
            
            
            
            if let info = global_json?[heading]["description"].string
            {
                localWorkshopInfo = info
                
            }
            if let info = global_json?[heading]["team"].string
            {
                localWorkshopInfo += info
                
            }
            if let info = global_json?[heading]["date"].string
            {
                localWorkshopInfo += info
            }
            if let info = global_json?[heading]["cost"].string
            {
                localWorkshopInfo += info
            }
            if let info = global_json?[heading]["time"].string
            {
                localWorkshopInfo += info
            }
        }
        
        workshopInfo.attributedText = nsAttributedString(localWorkshopInfo)
        
    }
    
    
    func setInitial()
    {
        let heading = titles[0]
        workshopLabel.text = heading
        var localWorkshopInfo = ""
        
        if let info = global_json?[heading]["description"].string
        {
                localWorkshopInfo = info
        }
        if let info = global_json?[heading]["team"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json?[heading]["date"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json?[heading]["cost"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json?[heading]["time"].string
        {
                localWorkshopInfo += info
        }
        workshopInfo.attributedText = nsAttributedString(localWorkshopInfo)
    }
    
    func getData() 
    {
        //self.titles.popLast()
        if(global_json != nil)
        {
            for (key,_):(String,JSON) in self.global_json!
            {
                self.titles.append(key)
            }
            self.setInitial()
            self.workshopCarousel.reloadData()
        }
        self.titles = self.titles.sort()
    }

}
