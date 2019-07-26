//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by Vinte on 2019/7/26.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    let playView : AVPlayerViewController = AVPlayerViewController()

    @IBOutlet weak var videoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "PlayLocalVideo"
        
        videoTableView.register(VideoCell.self, forCellReuseIdentifier: "identifier")
    }


}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        let url = NSURL.init(fileURLWithPath: path!)
        playView.player = AVPlayer.init(url: url as URL)
        
        self.present(playView, animated: true) {
            self.playView.player?.play()
        }
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        cell.imageView?.image = UIImage.init(named: "videoScreenshot01")
        return cell
    }
    
}
