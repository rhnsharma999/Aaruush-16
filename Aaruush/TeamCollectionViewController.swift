//
//  TeamCollectionViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 24/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import TRMosaicLayout

private let reuseIdentifier = "cell"

class TeamCollectionViewController: UICollectionViewController {
    
    var selectedIndex:String!
    
    let data = ["krishna","sai_teja","vishnu","nandu","vijay","mahesh","anvesh","jaswanth","aditya","sridhar","aman","avinash","abhilash","udit","govinda", "jagadeesh","ashok","vamsinath","veda","yeshwanth","vinitha","kirtika","vinayak","ankit","anusha","rahul","vijayanurag","sai_kishore","pranshu","harish","koti","avinash2", "bharath","palash","harshit","harshad","shashank","aman_johri"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        

        self.collectionView?.registerNib(UINib(nibName: "TeamCell",bundle: nil), forCellWithReuseIdentifier: "cell");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        var vc = segue.destinationViewController as! DetailViewController
        vc.photoToShow = selectedIndex
        vc.nameToShow = selectedIndex
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TeamCollectionViewCell
        
        cell.photo.image = UIImage(named: data[indexPath.row]);
        
    
        // Configure the cell
    
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
       selectedIndex = data[indexPath.row]
        performSegueWithIdentifier("detail", sender: self);
        
        
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

extension TeamCollectionViewController: TRMosaicLayoutDelegate {
    
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
