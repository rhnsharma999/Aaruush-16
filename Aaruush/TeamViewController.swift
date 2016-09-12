//
//  TeamViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MRProgress
import ImageLoader
import RZTransitions
import KFSwiftImageLoader

class TeamViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    var team:JSON?
    var names = [String]()
    
    var selected = -1
    
    
    
    

    @IBOutlet var myCollection: UICollectionView!
    
    let data = ["krishna","sai_teja","vishnu","nandu","vijay","mahesh","anvesh","jaswanth","aditya","sridhar","aman","avinash","abhilash","udit","govinda","jagadeesh","ashok","vamsinath","veda","yeshwanth","vinitha","kirtika","vinayak","ankit","anusha","rahul","vijayanurag","sai_kishore","pranshu","harish","koti","avinash2", "bharath","palash","harshit","harshad","shashank","aman_johri"]
    
    override func viewDidLoad() {
        
        navigationController?.delegate = RZTransitionsManager.shared()
        MRProgressOverlayView.showOverlayAddedTo(self.view, title: "Getting Team list from server", mode: .IndeterminateSmallDefault, animated: true)
        
        
        
        
        getTeam();
        
        
        myCollection.backgroundColor = UIColor.clearColor();
        
        
       
            myCollection?.registerNib(UINib(nibName: "FiveSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s5);
        myCollection.registerNib(UINib(nibName: "SixSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s6);
        
        
        myCollection.delegate = self;
        myCollection.dataSource = self;
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = myCollection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SixSWalaCell
        
        let cell1 = myCollection.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! FiveSWalaCell
        
        //Animations initial setup
        cell.transform = CGAffineTransformMakeScale(0.5,0.5);
        cell1.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            let imgURL = "http://aaruush.net/images/team/" + team![indexPath.row]["imgSource"].string!;

            cell1.photo.load(imgURL)
            cell1.photoTitle.text = team![indexPath.row]["name"].string
            cell1.backgroundColor  = UIColor.clearColor();
            
            
             //Animate to pop
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell1.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            return cell1;
            
            
        }
        
        else
        {
            let imgURL = "http://aaruush.net/images/team/" + team![indexPath.row]["imgSource"].string!;
          //  let url = NSURL(string: imgURL)
            cell.myImage.load(imgURL);
           // cell.myImage.loadImageFromURL(url!)
            cell.myLabel.text = team![indexPath.row]["name"].string
            cell.backgroundColor  = UIColor.clearColor();
            
            
            //Animate to pop
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            
            return cell;
        }
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        selected = indexPath.row;
        
        
        RZTransitionsManager.shared().setAnimationController(RZZoomPushAnimationController(),
                                                             fromViewController:self.dynamicType,
                                                             toViewController:ProfileViewController.self,forAction:.PushPop)
        
        self.performSegueWithIdentifier(Reusable.TEAM_TO_PROFILE, sender: self);
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollection.frame.width/2, height: self.myCollection.frame.width/2);
        
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if(segue.identifier == Reusable.TEAM_TO_PROFILE)
        {
            let vc = segue.destinationViewController as! ProfileViewController
            vc.pos = team![selected]["pos"].string!
            vc.name = names[selected]
            vc.fbURL = team![selected]["fb"].string!
            vc.phoneNumber = team![selected]["contact"].string!
            
            let s = "http://aaruush.net/images/team/" + team![selected]["imgSource"].string!
            vc.profile = s;
            
            
            
            
            //vc.profile = team![selected]["imgSource"].string!;
            
        }
        
    }

   
    func getTeam()
    {
        
        let url = "http://aaruush.net/eventData/teamData.json"
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let some = JSON(value)
                    if(some != nil)
                    {
                        self.team = some;
                        
                        for i in 0...some.count-1
                        {
                            
                            self.names.append(some[i]["name"].string!);
                            
                            
                        }
                        
                    }
                    
                    
                    print(some.count);
                    
                    
                    self.myCollection.reloadData()
                    
                    MRProgressOverlayView.dismissAllOverlaysForView(self.view, animated: true);
                    
                    
                }
            case .Failure(let error):
                print("FAIL")
            }
        }
        
    }
 

}

