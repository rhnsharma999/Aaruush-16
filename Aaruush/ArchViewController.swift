//
//  ArchViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit


class ArchViewController: UIViewController,iCarouselDataSource,iCarouselDelegate {
    
    
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var Eventinfo: UITextView!
    let data = ["1","2","3","4"]; //dummmy data will change later
    
    
    
    @IBOutlet var myCarousel: iCarousel!

    override func viewDidLoad() {
        
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
        return data.count;
        
    }
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.myCarousel.center.x, self.myCarousel.center.y, self.view.bounds.width - 100, 200));
        myView.image = UIImage(named: data[index]);
        return myView
    }
    
    
 
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        
        eventTitle.text = "Selected Index \(myCarousel.currentItemIndex+1)";
        
        
        
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    


}
