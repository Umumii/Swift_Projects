//
//  HourMemter.swift
//  HourMeter
//
//  Created by Vinte on 2019/7/19.
//  Copyright © 2019 vinte. All rights reserved.
//

import Foundation

class HourMemter: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        counter = 0.0
        timer = Timer()
    }
}
