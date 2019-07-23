//
//  MineViewController.swift
//  FacebookMine
//
//  Created by Vinte on 2019/7/23.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    typealias RowModel = [String : String]
    // vinte
    fileprivate var user : MineUserModel {
        get {
            return MineUserModel.init(name: "ByMax", education: "CWU")
        }
    }

    // vinte
    fileprivate var tableViewDataSource : [[String : Any]] {
        get {
            return TableKeys.populate(withUser: user)
        }
    }
    // vinte
    var mineTableView : UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: .grouped)
        view.register(MineTableViewCell.self, forCellReuseIdentifier: MineTableViewCell.identifier)
        return view
    }()
    
    var obj : NSObject = {
        let oo = NSObject.init()
        return oo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Mine"
        navigationController?.navigationBar.barTintColor = Specs.color.tintColor
        
        mineTableView.delegate = self
        mineTableView.dataSource = self
        view.addSubview(mineTableView)
        
        mineTableView.translatesAutoresizingMaskIntoConstraints = false
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView":mineTableView]))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "W:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView":mineTableView]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": mineTableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": mineTableView]))
        // Do any additional setup after loading the view.
    }
    
    
    fileprivate func rows(at section: Int) -> [Any] {
        return tableViewDataSource[section][TableKeys.Rows] as! [Any]
    }
    
    fileprivate func title(at section: Int) -> String? {
        return tableViewDataSource[section][TableKeys.Section] as? String
    }
    
    fileprivate func rowModel(at indexPath: IndexPath) -> RowModel {
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(at: section).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelForRow = rowModel(at: indexPath)
        var cell = UITableViewCell()
        
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        
        if title == user.name {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: MineTableViewCell.identifier, for: indexPath)
        }
        
        cell.textLabel?.text = title
        
        if let imageName = modelForRow[TableKeys.ImageName] {
            cell.imageView?.image = UIImage(named: imageName)
        } else if title != TableKeys.logout {
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        
        if title == user.name {
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return 0.0
        }
        
        if title == user.name {
            return 64.0
        } else {
            return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let modelForRow = rowModel(at: indexPath)
        
        guard let title = modelForRow[TableKeys.Title] else {
            return
        }
        
        if title == TableKeys.seeMore || title == TableKeys.addFavorites {
            cell.textLabel?.textColor = Specs.color.tintColor
            cell.accessoryType = .none
        } else if title == TableKeys.logout {
            cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
            cell.textLabel?.textColor = Specs.color.red
            cell.textLabel?.textAlignment = .center
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
