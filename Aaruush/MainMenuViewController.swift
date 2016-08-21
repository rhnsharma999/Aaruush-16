//
//  MainMenuViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import RZTransitions
class MainMenuViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {

    
    var photos = [String]()
    @IBOutlet var myCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollection.reloadData()
        
        
        myCollection.delegate = self;
        myCollection.dataSource = self;
        //self.navigationController?.navigationBar.alpha = 0.0
        
        
        navigationController?.delegate = RZTransitionsManager.shared()
        photos = ["highlights","domains","workshops","sponsors","patrons1","team","wa"];
        
        
        self.myCollection?.registerNib(UINib(nibName: "FiveSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s5);
        self.myCollection?.registerNib(UINib(nibName: "SixSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s6);
        myCollection.backgroundColor = UIColor.clearColor();
        
        
        

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        
        
        
        
        
        
        
       
        myCollection.reloadData()
    }
    override func viewDidAppear(animated: Bool) {
        myCollection.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "credits")
        {
            var vc = segue.destinationViewController as! DetailViewController
            vc.nameToShow = "Powered By Webarch";
            vc.photoToShow = "wa"
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
        
        
        
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            fiveScell.photo.image = UIImage(named: photos[indexPath.row]);
            fiveScell.photoTitle.text = photos[indexPath.row];
            fiveScell.backgroundColor = UIColor.clearColor();
            return fiveScell;
            
        }
        else
        {
            sixScell.myImage.image = UIImage(named:photos[indexPath.row]);
            sixScell.myLabel.text = photos[indexPath.row];
            sixScell.backgroundColor = UIColor.clearColor();
            return sixScell;
        }
        
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollection.frame.width/2, height: self.myCollection.frame.width/2);
        
    }
    

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    

    
     func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        
        if(indexPath.row==5)
        {
            
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:TeamViewController.self,
                                                                  forAction:.PushPop)
            performSegueWithIdentifier("team", sender: self);
        }
        else if(indexPath.row==6)
        {
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:DetailViewController.self,
                                                                  forAction:.PushPop)
            
            performSegueWithIdentifier("credits", sender: self);
            
            
        }
            
        else if (indexPath.row == 1)
        {
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:DomainsViewController.self,
                                                                  forAction:.PushPop)
           performSegueWithIdentifier("toDomains", sender: self)
            
            
            
            
            
        }
        else
        {
            
            
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:HighlightsCollectionViewController.self,
                                                                  forAction:.PushPop)
            //performSegueWithIdentifier("selectOption", sender: self);
            
        }
        
        
        
        
        
        
    }


}
