//
//  DomainsViewController.swift
//  Aaruush
//
//  Created by HARSH SAXENA on 21/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import EZLoadingActivity
import MRProgress
import RZTransitions


class DomainsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var domainsCollectionView: UICollectionView!
    
    //<--------------------------NEtwork data------------------------------->
    
    
    
     var domain_names = [String]() //Domain Names here from the internet
    var global_JSON = [String:[String]]()
    var global_Event_Detail:JSON!
  
    var json:JSON?
    var selected:String!
    var dummyImage = UIImage()
    //<--------------------------NEtwork data------------------------------->
    
    
    
     //<--------------------------dummy data------------------------------->
    let domainImages = ["Architecture","Bluebook","Digital Design","Electrizite","Fundaz","konstruktion","machination","MAGEFFICIE","ONLINE","praesentatio","robogyan","vimanaz","x-zone","YUDDHAME"]
    //<--------------------------dummy data------------------------------->
    
   
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dummyImage = UIImage(named: "image")!
        
    }
    
  
    
    
    override func viewDidLoad()
    {
        
       

     //   print(global_Event_Detail)
        self.navigationItem.title = "Domains"
         navigationController?.delegate = RZTransitionsManager.shared()
        
  
        getData()
    
        
        
        
        
        super.viewDidLoad()
        
        domainsCollectionView.backgroundColor = UIColor.clearColor();
        domainsCollectionView.registerNib(UINib(nibName: "FiveSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s5);
        domainsCollectionView.registerNib(UINib(nibName: "SixSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s6);
        domainsCollectionView.delegate = self;
        domainsCollectionView.dataSource = self;
    
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return domain_names.count;
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = domainsCollectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SixSWalaCell
        let cell1 = domainsCollectionView.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! FiveSWalaCell
        
        
        cell.transform = CGAffineTransformMakeScale(0.5,0.5)
        cell1.transform = CGAffineTransformMakeScale(0.5,0.5)
        
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            //cell1.photo.image = UIImage(named: domainImages[indexPath.row]); //to be moved to a seperate thread
            cell1.photo.image = UIImage(named: "image")
            cell1.photoTitle.text=domain_names[indexPath.row];
            cell1.backgroundColor  = UIColor.clearColor();
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell1.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            return cell1;
            
            
            
            
        }
            
        else
        {
            cell.myImage.image = UIImage(named: "image")
            cell.myLabel.text = domain_names[indexPath.row];
            cell.backgroundColor  = UIColor.clearColor();
            
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            
            return cell;
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        selected = domain_names[indexPath.row]
        
        RZTransitionsManager.shared().setAnimationController(RZZoomPushAnimationController(),
                                                              fromViewController:self.dynamicType,
                                                              toViewController:ArchViewController.self,forAction:.PushPop)
        
        
        self.performSegueWithIdentifier(Reusable.MAIN_DOMAIN_TO_ARCH, sender: self)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.domainsCollectionView.frame.width/2, height: self.domainsCollectionView.frame.width/2);
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let svc = segue.destinationViewController as! ArchViewController
        
        svc.receivedData = global_JSON[selected]!
       svc.allData = global_Event_Detail
      //  svc.allData = nil;
        
        
        
    }
    
    
    func getData()
    {
        
        if(json != nil)
        {
            
            for (key,_):(String, JSON) in json!
            {
                
                self.domain_names.append(key) //getDomainNames
                var myArray = [String]()
                
                for i in 0...json![key].count
                {
                    if let some = json![key][i].string
                    {
                        myArray.append(some)
                    }
                }
                
                self.global_JSON[key] = myArray
                
                
                
                
                
                // print(self.global_JSON)
                
            }
            
        }
        self.domain_names = self.domain_names.sort()
        
        
        
        
   //     print(self.global_JSON)
      //  self.domainsCollectionView.reloadData()

      //  self.domainsCollectionView.hidden = false;
      
     
        
    }
    
   

}
