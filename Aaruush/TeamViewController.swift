//
//  TeamViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
  //  let transition = ZoomAnimator()
    
    
    
    var selectedImage:String!

    @IBOutlet var myCollection: UICollectionView!
    
    let data = ["krishna","sai_teja","vishnu","nandu","vijay","mahesh","anvesh","jaswanth","aditya","sridhar","aman","avinash","abhilash","udit","govinda","jagadeesh","ashok","vamsinath","veda","yeshwanth","vinitha","kirtika","vinayak","ankit","anusha","rahul","vijayanurag","sai_kishore","pranshu","harish","koti","avinash2", "bharath","palash","harshit","harshad","shashank","aman_johri"]
    
    override func viewDidLoad() {
        
        
        
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
        return data.count;
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = myCollection.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SixSWalaCell
        
        let cell1 = myCollection.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! FiveSWalaCell
        
        //Animations initial setup
        cell.transform = CGAffineTransformMakeScale(0.5,0.5);
        cell1.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            cell1.photo.image = UIImage(named: data[indexPath.row]);
            cell1.photoTitle.text=data[indexPath.row];
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
            cell.myLabel.text = data[indexPath.row];
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
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollection.frame.width/2, height: self.myCollection.frame.width/2);
        
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "details")
        {
            let vc = segue.destinationViewController as! ProfileViewController
          //  vc.transitioningDelegate = self;
            
            vc.image = selectedImage;
            
        }
        
    }

   
 

}

