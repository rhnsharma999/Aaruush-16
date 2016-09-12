//
//  MainMenuViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import RZTransitions
import SwiftyJSON
import Alamofire
import MRProgress
class MainMenuViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {

    //-------------to be sent to next views--------->
    var workshops:JSON?
    var domains:JSON?
    var domainDetail:JSON?
    var to_be_sent = [String:[String]]()
    //<------------to be sent to the next views----->
    
    var photos = [String]()
    @IBOutlet var myCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "Aaruush 16"
        
        myCollection.delegate = self;
        myCollection.dataSource = self;
        //self.navigationController?.navigationBar.alpha = 0.0
        
        
        navigationController?.delegate = RZTransitionsManager.shared()
        photos = ["highlights","domains","workshops","sponsors","patrons1","team","wa"];
        
        
        self.myCollection?.registerNib(UINib(nibName: "FiveSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s5);
        self.myCollection?.registerNib(UINib(nibName: "SixSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s6);
        myCollection.backgroundColor = UIColor.clearColor();
        
        
        
        
        if(internetCheck()) //fetch fresh data
        {
            
            getDomains()
            getDomainDetails()
            getWorkshops()
  
            
            //print(self.domains)
            //print(self.workshops)
            
            
        }


    }

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "credits")
        {
            let vc = segue.destinationViewController as! DetailViewController
            vc.nameToShow = "Powered By Webarch";
            vc.photoToShow = "wa"
        }
        else if(segue.identifier == Reusable.MAIN_TO_WORKSHOPS)
        {
            let vc = segue.destinationViewController as! WorkshopsViewController
            vc.global_json = self.workshops
          
        }
        else if(segue.identifier == Reusable.MAIN_TO_DOMAINS)
        {
            let vc = segue.destinationViewController as! DomainsViewController
            vc.global_Event_Detail = self.domainDetail
            vc.json = self.domains
          
        }
        
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count;
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let fiveScell = myCollection.dequeueReusableCellWithReuseIdentifier(Reusable.s5, forIndexPath: indexPath) as! FiveSWalaCell
        let sixScell = myCollection.dequeueReusableCellWithReuseIdentifier(Reusable.s6, forIndexPath: indexPath) as! SixSWalaCell
        
        
        //Animations initial setup
        sixScell.transform = CGAffineTransformMakeScale(0.5, 0.5)
        fiveScell.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        
        //initial setup end
        
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            fiveScell.photo.image = UIImage(named: photos[indexPath.row]);
            fiveScell.photoTitle.text = photos[indexPath.row];
            fiveScell.backgroundColor = UIColor.clearColor();
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                fiveScell.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            
            return fiveScell;
            
        }
        else
        {
            sixScell.myImage.image = UIImage(named:photos[indexPath.row]);
            sixScell.myLabel.text = photos[indexPath.row];
            sixScell.backgroundColor = UIColor.clearColor();
            
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                sixScell.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            return sixScell;
        }
        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollection.frame.width/2, height: self.myCollection.frame.width/2);
        
    }
    

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    

    
     func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
     {
        
        
        
        if(indexPath.row==5)
        {
            
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:TeamViewController.self,
                                                                  forAction:.PushPop)
            performSegueWithIdentifier(Reusable.MAIN_TO_TEAM, sender: self);
        }
        else if(indexPath.row==6)
        {
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:DetailViewController.self,
                                                                  forAction:.PushPop)
            
            performSegueWithIdentifier(Reusable.MAIN_TO_CREDITS, sender: self);
            
            
        }
            
        else if (indexPath.row == 1)
        {
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:DomainsViewController.self,
                                                                  forAction:.PushPop)
            performSegueWithIdentifier(Reusable.MAIN_TO_DOMAINS, sender:self.myCollection)
            
            
            
            
            
        }
        else if(indexPath.row == 4){
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:PatronsViewController.self,forAction:.PushPop)
                performSegueWithIdentifier(Reusable.MAIN_TO_PATRONS, sender: self)
        }
        else if(indexPath.row == 2){
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:WorkshopsViewController.self,forAction:.PushPop)
            performSegueWithIdentifier(Reusable.MAIN_TO_WORKSHOPS, sender: self)
        }
        else //under construction, to be removed
        {
            
            
            
         
            
        }
    }
    
    
    func internetCheck() ->Bool
    {
        let status = Reach().connectionStatus()
        
        switch status
        {
        case .Offline:
            return false;
           
        case .Online(.WWAN):
            return true;
       
        case .Online(.WiFi):
            return true;
       
        
        default:
            return false;
  
        }
        
    }
    
    func getWorkshops()
    {
         MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Fetching Fresh Data", mode: .IndeterminateSmallDefault, animated: true)
        
        let url = Reusable.WORKSHOPS_URL
        Alamofire.request(.GET, url).validate().responseJSON
            { response in
                switch response.result
                {
                case .Success:
                    if let value = response.result.value
                    {
                        self.workshops = JSON(value)
                        
                    }
                     MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                  
                   
                case .Failure(let error):
                    print(error)
                    MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                    
                }
        }
        
        
    }
    func getDomains()
    {
        MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Fetching Fresh Data", mode: .IndeterminateSmallDefault, animated: true)
            let url = Reusable.EVENT_DATA_URL
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    self.domainDetail = JSON(value)
                    MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                   
                  
                }
            case .Failure(let error):
                print(error)
                MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
            }
        }
        
        
    }
    
    func getDomainDetails()
    {
        
         MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Fetching Fresh Data", mode: .IndeterminateSmallDefault, animated: true)
            let url = Reusable.EVENT_TITLE_URL
        Alamofire.request(.GET, url).validate().responseJSON
            { response in
                switch response.result
                {
                case .Success:
                    if let value = response.result.value
                    {
                        
                       self.domains = JSON(value)
                        MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                        print(self.to_be_sent)
                    
                    }
                case .Failure(let error):
                    print(error)
                    MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true)
                }
                
        }
        
      
    }
    
  
    
}
