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
        
        
        self.myCollection?.registerNib(UINib(nibName: "DomainsCollectionCell",bundle: nil), forCellWithReuseIdentifier: "cell1");
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
        let cell = myCollection.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! DomainsCollectionViewCell
        
        cell.photo.image = UIImage(named: photos[indexPath.row]);
        cell.photoTitle.text = photos[indexPath.row];
        cell.backgroundColor = UIColor.clearColor();
        
        return cell;
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/2, height: self.view.frame.width/2);
        
    }
    

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10;
        
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
                                                                  toViewController:DCollectionViewController.self,
                                                                  forAction:.PushPop)
           // performSegueWithIdentifier("toDomains", sender: self)
            
            
            
            
            
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
