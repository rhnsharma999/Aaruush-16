//
//  DomainsViewController.swift
//  Aaruush
//
//  Created by HARSH SAXENA on 21/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class DomainsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var domainsCollectionView: UICollectionView!
    
   
    
    let domainImages = ["Architecture","Bluebook","Digital Design","Electrizite","Fundaz","konstruktion","machination","MAGEFFICIE","ONLINE","praesentatio","robogyan","vimanaz","x-zone","YUDDHAME"] //dummy data

    override func viewDidLoad() {
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
        return domainImages.count;
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = domainsCollectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SixSWalaCell
        let cell1 = domainsCollectionView.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! FiveSWalaCell
        
        
        cell.transform = CGAffineTransformMakeScale(0.5,0.5);
        cell1.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            cell1.photo.image = UIImage(named: domainImages[indexPath.row]); //to be moved to a seperate thread
            cell1.photoTitle.text=domainImages[indexPath.row];
            cell1.backgroundColor  = UIColor.clearColor();
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell1.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            return cell1;
            
            
            
            
        }
            
        else
        {
            cell.myImage.image = UIImage(named: domainImages[indexPath.row]); //to be moved to a seperate threa
            cell.myLabel.text = domainImages[indexPath.row];
            cell.backgroundColor  = UIColor.clearColor();
            
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            
            
            return cell;
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier(Reusable.MAIN_DOMAIN_TO_ARCH, sender: self)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.domainsCollectionView.frame.width/2, height: self.domainsCollectionView.frame.width/2);
        
    }


}
