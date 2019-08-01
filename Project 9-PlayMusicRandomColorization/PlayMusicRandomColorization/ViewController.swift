//
//  ViewController.swift
//  PlayMusicRandomColorization
//
//  Created by Vinte on 2019/8/1.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    var gradientLayer = CAGradientLayer()
    var audioPlayer = AVAudioPlayer()
    var timer : Timer?
    var backgroundColor :(red : CGFloat, green : CGFloat, blue : CGFloat, alpha : CGFloat)! {
        didSet {
            let color1 = UIColor(red: backgroundColor.blue,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //graditent color
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer)
    }

    @IBAction func playButtonEvent(_ sender: Any) {
        let playBtn = sender as! UIButton
        playBtn.isHidden = true
        
        let audioPath = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!
        let audioUrl = URL(fileURLWithPath: audioPath)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: audioUrl)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            audioPlayer.numberOfLoops = Int(INT_MAX);
            audioPlayer.volume = 0.9;
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        if timer == nil {
            unowned let weakSelf = self
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: weakSelf, selector: #selector(self.timerEvent), userInfo: nil, repeats: true)
            timer?.fire()
        }
    }
    
    @objc func timerEvent() {
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        backgroundColor = (redValue, blueValue, greenValue, 1)
    }
}

