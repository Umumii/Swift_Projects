//
//  VTNewsTableViewController.swift
//  SlideMeun
//
//  Created by Vinte on 2019/8/6.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class VTNewsTableViewController: VTBaseTableViewController {
    
    var tranMgr = VTTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Everyday Moments"
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableViewController = segue.destination as! VTMenuTableViewController
        menuTableViewController.currentItemTiele = self.title!
        menuTableViewController.transitioningDelegate = tranMgr
        tranMgr.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! VTNewsTableViewCell

        if indexPath.row == 0 {
            cell.backImageView.image = UIImage.init(named: "1");
            cell.contentLabel.text = "Love mountain.";
            cell.subContentLabel.text = "Allen Wang"
            cell.headImageView.image = UIImage.init(named: "a")
        }
        else if (indexPath.row == 1) {
            cell.backImageView.image = UIImage.init(named: "2");
            cell.contentLabel.text = "New graphic design - LIVE FREE";
            cell.subContentLabel.text = "Cole"
            cell.headImageView.image = UIImage.init(named: "b")
        }
        else if (indexPath.row == 2) {
            cell.backImageView.image = UIImage.init(named: "3");
            cell.contentLabel.text = "Summer sand";
            cell.subContentLabel.text = "Daniel Hooper"
            cell.headImageView.image = UIImage.init(named: "c")
        }
        else {
            cell.backImageView.image = UIImage.init(named: "4");
            cell.contentLabel.text = "Seeking for signal";
            cell.subContentLabel.text = "Noby-Wan Kenobi"
            cell.headImageView.image = UIImage.init(named: "d")
        }
        // Configure the cell...

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 241
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VTNewsTableViewController : VTTransitionManagerDelegate {
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
