//
//  DomainsCollectionViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 23/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import TRMosaicLayout
import RZTransitions



class DomainsCollectionViewController: UICollectionViewController {
    var photos = [String]()

    override func viewDidLoad() {
        
        navigationController?.delegate = RZTransitionsManager.shared()
        photos = ["highlights","domains","workshops","sponsors","patrons1","team","wa"];
        
        
        
        self.collectionView?.registerNib(UINib(nibName: "DomainsCollectionCell",bundle: nil), forCellWithReuseIdentifier: "cell");
        
        let mosaicLayout = TRMosaicLayout()
    //    self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
    //    self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
    
    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 9
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! FiveSWalaCell
    
        if(indexPath.row<7)
        {
            cell.photoTitle.text = "";
            cell.photo.image = UIImage(named:photos[indexPath.row]);
            cell.photo.layer.cornerRadius = cell.photo.frame.width/2;
            cell.photo.layer.masksToBounds = true
            cell.backgroundColor = UIColor.clearColor()
            
            
        }
        else
        {
             cell.photo.image = UIImage(named:"blank" );
        }
        
        // Configure the cell
    
        return cell
    }
    
  
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
       
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
            performSegueWithIdentifier("toDomains", sender: self)
        }
        else
        {
            
            
            RZTransitionsManager.shared().setAnimationController( RZZoomPushAnimationController(),
                                                                  fromViewController:self.dynamicType,
                                                                  toViewController:HighlightsCollectionViewController.self,
                                                                  forAction:.PushPop)
            performSegueWithIdentifier("selectOption", sender: self);
            
        }
        
       
        
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
  

    
}




extension DomainsCollectionViewController: TRMosaicLayoutDelegate {
    
    func collectionView(collectionView:UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath:NSIndexPath) -> TRMosaicCellType {
        // I recommend setting every third cell as .Big to get the best layout
        return indexPath.item % 3 == 0 ? TRMosaicCellType.Big : TRMosaicCellType.Small
    }
    
    func collectionView(collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func heightForSmallMosaicCell() -> CGFloat {
        return 150
    }
}

