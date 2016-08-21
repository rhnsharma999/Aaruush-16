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
    
    var selectedImage = ""
    
    let domainImages = ["Architecture","Bluebook","Digital Design","Electrizite","Fundaz","konstruktion","machination","MAGEFFICIE","ONLINE","praesentatio","robogyan","vimanaz","x-zone","YUDDHAME"]

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
        
        
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            cell1.photo.image = UIImage(named: domainImages[indexPath.row]);
            cell1.photoTitle.text=domainImages[indexPath.row];
            cell1.backgroundColor  = UIColor.clearColor();
            return cell1;
        }
            
        else
        {
            cell.myImage.image = UIImage(named: domainImages[indexPath.row]);
            cell.myLabel.text = domainImages[indexPath.row];
            cell.backgroundColor  = UIColor.clearColor();
            return cell;
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        selectedImage = domainImages[indexPath.row];
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.domainsCollectionView.frame.width/2, height: self.domainsCollectionView.frame.width/2);
        
    }


}
