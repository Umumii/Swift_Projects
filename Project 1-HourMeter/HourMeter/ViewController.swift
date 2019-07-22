//
//  ViewController.swift
//  HourMeter
//
//  Created by Vinte on 2019/7/19.
//  Copyright © 2019 vinte. All rights reserved.
//  

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    fileprivate let mainHoueMemter = HourMemter()
    fileprivate let tapHoueMemter = HourMemter()
    fileprivate var laps = [String]()
    fileprivate var isRun = false
    
    @IBOutlet weak var tapsTableView: UITableView!
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var tapResetButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var tapLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tapResetButton.isEnabled = false
        
        let initCornerButton : (UIButton) -> Void = { button in
            // button.backgroundColor = UIColor.blue
        }
        
        initCornerButton(tapResetButton)
        
        tapsTableView.delegate = self
        tapsTableView.dataSource = self
        
    }
    
    @IBAction func tapResetButtonEvent(_ sender: Any) {
        if !isRun {
            // run
            tapHoueMemter.timer.invalidate()
            tapHoueMemter.counter = 0.0
            tapLabel.text = "00:00.00"
            
            mainHoueMemter.timer.invalidate()
            mainHoueMemter.counter = 0.0
            mainLabel.text = "00:00.00"
            
            changeButton(tapResetButton, "Lap", UIColor.lightGray);
            tapResetButton.isEnabled = false;
            
            laps.removeAll()
            tapsTableView.reloadData();
        }
        else {
            // no run
            /*
             mine
             
             // update
             laps.append(tapLabel.text!)
             */
            if let timerLabelText = tapLabel.text {
                laps.append(timerLabelText)
            }
            
            tapsTableView.reloadData()
            
            tapHoueMemter.timer.invalidate()
            tapHoueMemter.counter = 0.0
            tapLabel.text = "00:00.00"

            unowned let weakSelf = self
            tapHoueMemter.timer = Timer.scheduledTimer(timeInterval: 0.01, target: weakSelf, selector: #selector(tapTimerEvent), userInfo: nil, repeats: true)
            
            RunLoop.current.add(tapHoueMemter.timer, forMode: RunLoop.Mode.default)
            
        }
    }
    
    @IBAction func startPauseButtonEvent(_ sender: Any) {
        tapResetButton.isEnabled = true;
        
        if !isRun {
            // run
            changeButton(tapResetButton, "Tap", UIColor.cyan)
            changeButton(startPauseButton, "Pause", UIColor.red)
            
            unowned let weakSelf = self
            mainHoueMemter.timer = Timer.scheduledTimer(timeInterval: 0.01, target: weakSelf, selector: #selector(mainTimerEvent), userInfo: nil, repeats: true)
            tapHoueMemter.timer = Timer.scheduledTimer(timeInterval: 0.01, target: weakSelf, selector: #selector(tapTimerEvent), userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainHoueMemter.timer, forMode: RunLoop.Mode.default)
            RunLoop.current.add(tapHoueMemter.timer, forMode: RunLoop.Mode.default)
            
        }
        else {
            // no run
            changeButton(tapResetButton, "Reset", UIColor.black)
            changeButton(startPauseButton, "Start", UIColor.green)

            mainHoueMemter.timer.invalidate()
            tapHoueMemter.timer.invalidate()
            
        }
        isRun = !isRun
    }
    
    func changeButton(_ button: UIButton,_ title : String,_ color: UIColor){
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitleColor(color, for: UIControl.State.normal)
    }
   

    @objc func mainTimerEvent() {
        updateTimer(mainHoueMemter, label: mainLabel)
    }
    
    @objc func tapTimerEvent() {
        updateTimer(tapHoueMemter, label: tapLabel)
    }

    func updateTimer(_ stopwatch: HourMemter, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.01
        
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopwatch.counter / 60))"
        }
        
        var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "lapCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
        }
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
        }
        
        return cell
    }
    
}


