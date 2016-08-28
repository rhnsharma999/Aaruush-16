//
//  ArchViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation


class ArchViewController: UIViewController,iCarouselDataSource,iCarouselDelegate {
    
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var Eventinfo: UITextView!
 
    
    var receivedData = [String]()
    var allData: JSON!
    
    
    
    
    @IBOutlet var myCarousel: iCarousel!
    
    
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
        //Eventinfo.backgroundColor = UIColor.whiteColor()
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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true;
        
    }
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false;
    }
    override func viewDidLayoutSubviews() {
        self.backButton.layer.cornerRadius = self.backButton.bounds.width/2
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
        var localEventInfo = ""
        eventTitle.text = title
        
        
        if let desc = allData[title]["desc"].string
        {
            localEventInfo = desc
            
        }
        
        if let rounds =  allData[title]["rounds"].string
        {
            localEventInfo += rounds
        }
        
        //Eventinfo.text =  Eventinfo.text + "\n\n";
        
        if let coords = allData[title]["coords"].string
        {
            localEventInfo += coords
        }
     
        Eventinfo.attributedText = nsAttributedString(localEventInfo)
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        
       // self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func initialSet()
    {
        let title = receivedData[0]
        
        eventTitle.text = title
        var localEventInfo = ""
        
        if let desc = allData[title]["desc"].string
        {
            localEventInfo = desc
            
        }
        //Eventinfo.text =  Eventinfo.text + "\n\n";
        
        if let rounds =  allData[title]["rounds"].string
        {
            localEventInfo += rounds
            
        }
        if let coords = allData[title]["coords"].string
        {
            localEventInfo += coords
            
        }
        Eventinfo.attributedText = nsAttributedString(localEventInfo)
        
        
    }
}
