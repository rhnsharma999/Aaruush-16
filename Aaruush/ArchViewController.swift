//
//  ArchViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import SwiftyJSON


class ArchViewController: UIViewController,iCarouselDataSource,iCarouselDelegate {
    
    
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var Eventinfo: UITextView!
 
    
    public var receivedData = [String]()
    public var allData: JSON!
    
    
    
    
    @IBOutlet var myCarousel: iCarousel!

    override func viewDidLoad() {
        
        
    
       
        initialSet()
        
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            self.Eventinfo.font = .systemFontOfSize(13)
        }
        
        myCarousel.dataSource = self
        myCarousel.delegate = self

        myCarousel.type = .CoverFlow
        myCarousel.backgroundColor = UIColor.clearColor()
        myCarousel.pagingEnabled = true
        myCarousel.contentMode = .ScaleAspectFill
        super.viewDidLoad()
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return receivedData.count;
        
    }
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.myCarousel.center.x, self.myCarousel.center.y, self.view.bounds.width - 100, 200));
        myView.image = UIImage(named: "1");
        return myView
    }
    
    
 
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        
        let title = receivedData[myCarousel.currentItemIndex]
        
        
        
        if let desc = allData[title]["desc"].string
        {
            Eventinfo.text = desc
            
        }
        Eventinfo.text =  Eventinfo.text + "\n\n";
        
        if let rounds =  allData[title]["rounds"].string
        {
            Eventinfo.text = Eventinfo.text + rounds
        
        }
        
        Eventinfo.text =  Eventinfo.text + "\n\n";
        
        if let coords = allData[title]["coords"].string
        {
            Eventinfo.text = Eventinfo.text + coords
            
        }
        
        
        
        
        eventTitle.text = title
        
        
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func initialSet()
    {
        let title = receivedData[0]
        
        eventTitle.text = title
        
        if let desc = allData[title]["desc"].string
        {
            Eventinfo.text = desc
            
        }
        Eventinfo.text =  Eventinfo.text + "\n\n";
        
        if let rounds =  allData[title]["rounds"].string
        {
            Eventinfo.text = Eventinfo.text + rounds
            
        }
        
        Eventinfo.text =  Eventinfo.text + "\n\n";
        
        if let coords = allData[title]["coords"].string
        {
            Eventinfo.text = Eventinfo.text + coords
            
        }
        
    }


}
