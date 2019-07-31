//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Vinte on 2019/7/31.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 0
    let cellIdentifer = "NewCellIdentifier"
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 64))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.layoutView()
        
    }

    func layoutView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        
        emojiData = favoriteEmoji
        let emojiTableView = tableView
        
        emojiTableView?.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView?.dataSource = self
        emojiTableView?.delegate = self
        
        tableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(self.didRoadEmoji), for: .valueChanged)
        
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.white
        
        self.title = "emoji"
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        emojiTableView?.rowHeight = UITableView.automaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)
    }

    @objc func didRoadEmoji() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.emojiData = [self.newFavoriteEmoji,self.favoriteEmoji][self.index]
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            self.index = (self.index + 1) % 2
        }
    }
}


extension ViewController : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifer)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: self.cellIdentifer)
            cell!.textLabel!.textAlignment = NSTextAlignment.center
            cell!.textLabel!.font = UIFont.systemFont(ofSize: 50)
            cell!.backgroundColor = UIColor.clear
            cell!.selectionStyle = UITableViewCell.SelectionStyle.none
        }
        
        cell?.textLabel?.text = emojiData[indexPath.row]
        
        return cell!
    }
    
    
}
