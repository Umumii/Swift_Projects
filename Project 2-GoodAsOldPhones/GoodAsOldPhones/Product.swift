//
//  Products.swift
//  GoodAsOldPhones
//
//  Created by Vinte on 2019/7/22.
//  Copyright © 2019 vinte. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    
    init(name : String, cellImageName : String, fullscreenImageName : String) {
        self.name = name
        self.cellImageName = cellImageName;
        self.fullscreenImageName = fullscreenImageName;
    }
    
}
