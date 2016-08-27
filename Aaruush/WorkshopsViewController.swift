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
import EZLoadingActivity

class WorkshopsViewController: UIViewController,iCarouselDelegate,iCarouselDataSource {
    
    
    
    //<--------------------------NEtwork data------------------------------->
  
    var global_json:JSON!
    var titles = [""]
    //<--------------------------NEtwork data------------------------------->
    
    
    
    //dummy data, will change later
    let data = ["accelerobotics","application_of_gis","entreprenuer_and_business_plan","hacktrack","motor_bike_overhauling","rc_cars","trancebotics","wireless_sensor_networks"]
    
    @IBOutlet weak var workshopCarousel: iCarousel!
    
    @IBOutlet weak var workshopLabel: UILabel!

    @IBOutlet weak var workshopInfo: UITextView!
    
    @IBAction func goBack(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    
    override func viewDidLoad() {
        
        self.workshopInfo.hidden = true;
        self.workshopCarousel.hidden = true;
        self.workshopLabel.hidden = true;
        
       
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            self.workshopInfo.font = .systemFontOfSize(13)
        }
        
        
        EZLoadingActivity.show("Loading...", disableUI: true)
        getData()
        
        
        
        
        super.viewDidLoad()
        if(UIScreen.mainScreen().bounds.height == 568)
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
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return titles.count
        
    }
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.workshopCarousel.center.x, self.workshopCarousel.center.y, self.view.bounds.width - 100, 200))
        myView.image = UIImage(named: "accelerobotics")
        
        
        
        
        
        
        return myView
    }
    
    
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        
        let heading = titles[carousel.currentItemIndex]
        workshopLabel.text = heading
        
        var localWorkshopInfo = ""
        
        if let info = global_json[heading]["description"].string
        {
            localWorkshopInfo = info
            
        }
        if let info = global_json[heading]["team"].string
        {
            localWorkshopInfo += info
            
        }
        if let info = global_json[heading]["date"].string
        {
           localWorkshopInfo += info
        }
        if let info = global_json[heading]["cost"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json[heading]["time"].string
        {
            localWorkshopInfo += info
        }
        
        workshopInfo.attributedText = nsAttributedString(localWorkshopInfo)
        
    }
    
    
    func setInitial()
    {
        let heading = titles[0]
        workshopLabel.text = heading
        var localWorkshopInfo = ""
        
        if let info = global_json[heading]["description"].string
        {
                localWorkshopInfo = info
        }
        if let info = global_json[heading]["team"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json[heading]["date"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json[heading]["cost"].string
        {
            localWorkshopInfo += info
        }
        if let info = global_json[heading]["time"].string
        {
                localWorkshopInfo += info
        }
        workshopInfo.attributedText = nsAttributedString(localWorkshopInfo)
    }
    
    func getData()
    {
        let url = "http://aaruush.net/testing123/eventData/workshop.json"
        Alamofire.request(.GET, url).validate().responseJSON
            { response in
                switch response.result
                {
                case .Success:
                    if let value = response.result.value
                    {
                        self.global_json = JSON(value)
                        
                        self.titles.popLast()
                        for (key,_):(String,JSON) in self.global_json
                        {
                            self.titles.append(key)
                        }
                         self.setInitial()
                        self.workshopCarousel.reloadData()
                        self.workshopInfo.hidden = false;
                        self.workshopCarousel.hidden = false;
                        self.workshopLabel.hidden = false;
                        
                        EZLoadingActivity.hide()
                    }
                case .Failure(let error):
                    print(error)
                    EZLoadingActivity.hide(success: false, animated: true)
                }
        }
    }

}
