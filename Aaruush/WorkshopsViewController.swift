//
//  WorkshopsViewController.swift
//  Aaruush
//
//  Created by HARSH SAXENA on 25/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class WorkshopsViewController: UIViewController,iCarouselDelegate,iCarouselDataSource {
    
    //dummy data, will change later
    let data = ["accelerobotics","application_of_gis","entreprenuer_and_business_plan","hacktrack","motor_bike_overhauling","rc_cars","trancebotics","wireless_sensor_networks"]
    
    @IBOutlet weak var workshopCarousel: iCarousel!
    
    @IBOutlet weak var workshopLabel: UILabel!

    @IBOutlet weak var workshopInfo: UITextView!
    
    @IBAction func goBack(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
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
        return data.count
        
    }
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        let myView = UIImageView(frame: CGRectMake(self.workshopCarousel.center.x, self.workshopCarousel.center.y, self.view.bounds.width - 100, 200))
        myView.image = UIImage(named: data[index])
        return myView
    }
    
    
    
    func carouselCurrentItemIndexDidChange(carousel: iCarousel) {
        
        workshopLabel.text = "Selected Index \(workshopCarousel.currentItemIndex+1)";
        
        
        
    }

}
