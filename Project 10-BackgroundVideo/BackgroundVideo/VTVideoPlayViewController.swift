//
//  VTVideoPlayViewController.swift
//  BackgroundVideo
//
//  Created by Vinte on 2019/8/1.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

public enum VTVideoPalyScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

class VTVideoPlayViewController: UIViewController {
    
    fileprivate var moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerVolum : Float = 1.0
    
    var contentUrl : URL? {
        didSet {
            if let _contentUrl = contentUrl {
                setMoviePlayer(contentUrl: _contentUrl)
            }
        }
    }
    
    var videoFrame : CGRect = CGRect()
    var startTime : CGFloat = 0.0
    var duration : CGFloat = 0.0
    var backgroundColor : UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }

    var sound : Bool = true {
        didSet {
            if sound {
                moviePlayerVolum = 1.0
            }
            else {
                moviePlayerVolum = 0.0
            }
        }
    }
    
    var alpha : CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    var alwaysRepeat : Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self,
                                                       selector: #selector(self.playerItemDidReachEnd),
                                                       name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                       object: moviePlayer.player?.currentItem)            }
        }
        
        
    }
    
    var fillMode : VTVideoPalyScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)

    }
    @objc func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: CMTime.zero)
        moviePlayer.player?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    fileprivate func setMoviePlayer(contentUrl : URL) {
        let videoCutter = VTVideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: contentUrl, startTime: startTime, duration: duration) { (videoPath, error) in
            if let path = videoPath as URL? {
                DispatchQueue.main.async {
                    self.moviePlayer.player = AVPlayer(url: path)
                    self.moviePlayer.player?.play()
                    self.moviePlayer.player?.volume = self.moviePlayerVolum
                }
            }
        }
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
