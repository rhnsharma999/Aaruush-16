//
//  DCollectionViewController.swift
//  Aaruush
//
//  Created by HARSH SAXENA on 25/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import TRMosaicLayout

private let reuseIdentifier = "cell"

class DCollectionViewController: UICollectionViewController {
    
    
    let data = ["Architecture","Bluebook","Digital Design","Electrizite","Fundaz","konstruktion","machination","MAGEFFICIE","ONLINE","praesentatio","robogyan","vimanaz","x-zone","YUDDHAME"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        let mosaicLayout = TRMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
        
        
        self.collectionView?.registerNib(UINib(nibName: "TeamCell",bundle: nil), forCellWithReuseIdentifier: "cell");


        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count+1
        
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TeamCollectionViewCell
    
        // Configure the cell
        if(indexPath.row<14){
            cell.photo.image = UIImage(named: data[indexPath.row])
            cell.name.text = data[indexPath.row]
        
        }
        else{
            cell.photo.image = UIImage(named: "blank")
            cell.name.text = ""
        }
    
        return cell
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
extension DCollectionViewController: TRMosaicLayoutDelegate {
    
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

