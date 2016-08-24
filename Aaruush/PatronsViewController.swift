//
//  PatronsViewController.swift
//  Aaruush
//
//  Created by HARSH SAXENA on 24/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class PatronsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var patronsCollectionView: UICollectionView!
    
    var selectedImage = ""
    
    
    //dummy data
    
    let data = ["convenor","director","eo","fa"]
    let titles =  ["Prof. Rathinam. A\nConvenor","Dr. C.Muthamizchelvan\nDirector - E & T","Mr.V.Thirumurugan\nEstate Officer","Prof.V.M.Ponniah\nFinance Advisor"];
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        patronsCollectionView.backgroundColor = UIColor.clearColor();
        patronsCollectionView.registerNib(UINib(nibName: "FiveSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s5);
        patronsCollectionView.registerNib(UINib(nibName: "SixSWalaCell",bundle: nil), forCellWithReuseIdentifier: Reusable.s6);
        patronsCollectionView.delegate = self;
        patronsCollectionView.dataSource = self;
        

    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count;
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = patronsCollectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SixSWalaCell
        
        let cell1 = patronsCollectionView.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! FiveSWalaCell
        
        //Animations initial setup
        cell.transform = CGAffineTransformMakeScale(0.5,0.5);
        cell1.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            cell1.photo.image = UIImage(named: data[indexPath.row]);
            cell1.photoTitle.text=titles[indexPath.row];
            cell1.backgroundColor  = UIColor.clearColor();
            
            
            //Animate to pop
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                
                cell1.transform = CGAffineTransformIdentity
                
                }, completion: nil);
            
            return cell1;
            
            
        }
            
        else
        {
            cell.myImage.image = UIImage(named: data[indexPath.row]);
            cell.myLabel.text = titles[indexPath.row];
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
        selectedImage = data[indexPath.row];
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.patronsCollectionView.frame.width/2, height: self.patronsCollectionView.frame.width/2);
        
    }

  }
