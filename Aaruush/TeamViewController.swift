//
//  TeamViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 18/08/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

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
            
            
        
        
        
        cell1.photo.image = UIImage(named: data[indexPath.row]);
        cell1.photoTitle.text=data[indexPath.row];
        cell1.backgroundColor  = UIColor.clearColor();
        
        cell.myImage.image = UIImage(named: data[indexPath.row]);
        cell.myLabel.text = data[indexPath.row];
        cell.backgroundColor  = UIColor.clearColor();
        
        if(UIScreen.mainScreen().bounds.height == 568)
        {
            return cell1;
            
            
        }
        
        else
        {
            return cell;}
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30;
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.myCollection.frame.width/2, height: self.myCollection.frame.width/2);
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
