//
//  EventsTableViewController.swift
//  Aaruush
//
//  Created by Rohan Lokesh Sharma on 11/07/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import FoldingCell

class EventsTableViewController: UITableViewController {
    
    var rows:Int!
    var imgArray = ["bob the builder","clash of clans","green house"];
    var titleArray = ["bob the builder","clash of clans","green house"];
    var discArray = ["Let us introduce another bob to the world through you. Architecture floor presents you to utilize this opportunity, show your extra ordinary skills and help us to give you a brand new recognition.\nNancy Lath 9962644687 \nRakhi yadav 9360266111 \nShivam 8056290449 \nShishir 9003235448",
                     
                     "We give the floor for the artistic skills for becoming an another Leonardo Da Vinci to sketch and construct the architecture dreams you have. \nB.K.Sai Sumanth 8939020458\nR.Hari Prasad 9962942860\nSrimanth 9581145139",
                     
                     "You are here to build your own hall of frame with your eloquence . Congregate your talents and skills and let the architects peep outside these closed windows. Come join us in realizing this green dream. \nV.R.Pratyusha 8939741278 \nMakrand 9003752053 \nSoujanya 9176043462"]
    
    
    
    let kCloseCellHeight: CGFloat = 145 // equal or greater foregroundView height
    let kOpenCellHeight: CGFloat = 450 // equal or greater containerView height
      var cellHeights = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(rgb:0x007096)
        
        for _ in 0...3 {
            cellHeights.append(kCloseCellHeight)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        rows = 3;
        return rows;
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EventsTableViewCell

        cell.backgroundColor = UIColor.clearColor();
        cell.containerViewImage.image = UIImage(named: imgArray[indexPath.row]);
        cell.containerViewMainTitle.text = titleArray[indexPath.row];
        cell.containerViewDescription.text = discArray[indexPath.row];
        
        
        

        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
        
        var duration = 0.0
        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell is FoldingCell {
            let foldingCell = cell as! FoldingCell
            
            if cellHeights[indexPath.row] == kCloseCellHeight {
                foldingCell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                foldingCell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
