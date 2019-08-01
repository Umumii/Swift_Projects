//
//  ViewController.swift
//  BackgroundVideo
//
//  Created by Vinte on 2019/8/1.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class ViewController: VTVideoPlayViewController {

    @IBOutlet weak var sigupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginButton.layer.cornerRadius = 5.0;
        sigupButton.layer.cornerRadius = 5.0;
        
        layoutBackView();
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    
    func layoutBackView() {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 0.0
        alpha = 0.8
        
        contentUrl = url
    }

}

