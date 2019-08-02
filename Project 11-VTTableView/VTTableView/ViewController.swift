//
//  ViewController.swift
//  VTTableView
//
//  Created by Vinte on 2019/8/2.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var vtTableView : UITableView = UITableView()
    var vtDataSource : [String] = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black
        
        vtTableView = UITableView.init(frame: self.view.bounds, style: .plain)
        vtTableView.delegate = self
        vtTableView.dataSource = self
        self.view.addSubview(vtTableView)
        vtTableView.backgroundColor = UIColor.clear
        vtTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        vtTableView.register(VTTableViewCell.self, forCellReuseIdentifier: VTTableViewCell.cellIdentifier)
        vtTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func cellFontAndColor(index : Int) -> UIColor{
        let itemCount = vtDataSource.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
}


extension ViewController : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ceil(UIScreen.main.bounds.size.height / CGFloat(vtDataSource.count))
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vtDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VTTableViewCell.cellIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = vtDataSource[indexPath.row]
        cell.textLabel?.textColor = .white
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = cellFontAndColor(index: indexPath.row)
    }
    
}
