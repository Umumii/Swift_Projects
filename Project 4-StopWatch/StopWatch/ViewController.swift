//
//  ViewController.swift
//  StopWatch
//
//  Created by Vinte on 2019/7/24.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    // var timer1 : Timer 类初始化是必须初始化
    var timer2 : Timer?
    var timer3 : Timer!
    var timer4 : Timer = Timer()
    var timer5 = Timer()
    var timer6 : Timer = {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            
        })
        return timer
    }()
    
    // 给予timer一个默认值，这样timer就不会为Optional,
    // 后续可以不用再解包
    // var timer = Timer()
    
    // 这样定义可以在不用timer时回收内存
    var timer : Timer? = Timer()
    var isPlay = false
    var counter : CGFloat = 0.0 {
        // 属性观察器，赋值的时候，调用
        // 属性被赋值前调用。
        willSet {
            // print("willset counter is \(newValue)")
        }
        // 属性被赋值后调用。
        didSet {
            countLabel.text = String(format: "%.1f",oldValue)
        }
    }

    // 知识点：存储属性和计算属性
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // 只读计算属性，可以去掉get和花括号
        //        get {
        //            return UIStatusBarStyle.lightContent
        //        }
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeButtonToEnable(button: pauseButton)
    }
    
    @IBAction func pauseButtonEvent(_ sender: Any) {
        if !isPlay {
            return
        }
        
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
        isPlay = !isPlay
        changeButtonToEnable(button: pauseButton)
        changeButtonToUnenable(button: startButton)
    }
    
    @IBAction func startButtonEvent(_ sender: Any) {
        if isPlay {
            return
        }
        unowned let weakSelf = self
        // 建议使用self.方法
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: weakSelf, selector: #selector(self.timerEvent), userInfo: nil, repeats: true)
        isPlay = !isPlay
        changeButtonToUnenable(button: pauseButton)
        changeButtonToEnable(button: startButton)
    }
    
    @IBAction func resetButtonEvent(_ sender: Any) {
        // 判断存在timer，销毁定时器，再将定时器置空。
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
        counter = 0
        isPlay = false
        changeButtonToEnable(button: pauseButton)
        changeButtonToUnenable(button: startButton)
    }
    
    @objc func timerEvent() {
        counter += 0.1
    }
    
    func changeButtonToEnable(button : UIButton) {
        button.setTitleColor(UIColor.gray, for: .normal)
        button.isEnabled = false
    }
    
    func changeButtonToUnenable(button : UIButton) {
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = true
    }
}

