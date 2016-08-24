//
//  ArchViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import TGLParallaxCarousel

class ArchViewController: UIViewController,iCarouselDataSource,iCarouselDelegate {
    
    
    @IBOutlet var Eventinfo: UITextView!
    let data = ["1","2","3","4"];
    
    
    
    @IBOutlet var myCarousel: iCarousel!

    override func viewDidLoad() {
        
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
        
        Eventinfo.text =  "\n You have selected index \(self.myCarousel.currentItemIndex)";
        
        
    }
    
    


}
