//
//  VTBaseTableViewController.swift
//  SlideMeun
//
//  Created by Vinte on 2019/8/6.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class VTBaseTableViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
}
