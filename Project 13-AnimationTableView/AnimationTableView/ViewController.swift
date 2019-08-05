//
//  ViewController.swift
//  AnimationTableView
//
//  Created by Vinte on 2019/8/5.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var vtTableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom", "Hop on a call to mom 9", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom", "Hop on a call to mom 9"]

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(VTTableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.animatedCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vtTableData.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = vtTableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorforIndex(indexPath.row)
    }
}

extension ViewController {
    func animatedCell() {
        self.tableView.reloadData()
        
        let cells = self.tableView.visibleCells
        let tableHeight = self.tableView.bounds.size.height
        
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            
            UIView.animate(withDuration: 1.0, delay: 0.1 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
    }
    
    func colorforIndex(_ index: Int) -> UIColor {
        
        let itemCount = vtTableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
}

