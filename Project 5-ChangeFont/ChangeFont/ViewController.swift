//
//  ViewController.swift
//  ChangeFont
//
//  Created by Vinte on 2019/7/25.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fontTableView: UITableView!
    @IBOutlet weak var fontLabel: UILabel!
    
    static let identifier = "identifier"
    var contents = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」",
                    "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体",
                    "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                    "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    let fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "Zapfino",
                     "Gaspar Regular"]
    var fontCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fontTableView.delegate = self
        fontTableView.dataSource = self
        fontTableView.backgroundColor = UIColor.clear
        
        fontTableView.tableFooterView = UIView.init()
        fontTableView.separatorStyle = .none
        
        fontLabel.layer.cornerRadius = 50
        fontLabel.layer.masksToBounds = true
        
        fontLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapGetEvent))
        fontLabel.addGestureRecognizer(tap)
        
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc func tapGetEvent() {
        fontCount = (fontCount + 1) % 5
        fontTableView.reloadData()
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.identifier, for: indexPath)
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
    
        let content = contents[indexPath.row]
        let fontName = fontNames[fontCount]
        cell.textLabel?.text = content
        cell.textLabel?.font = UIFont.init(name: fontName, size: 16)
        return cell
    }
    
}
