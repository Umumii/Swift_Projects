//
//  MineUserModel.swift
//  FacebookMine
//
//  Created by Vinte on 2019/7/23.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit

class MineUserModel: NSObject {
    var name: String
    var avatarName: String
    var education: String
    
    // vinte
    init(name : String, avatarName: String = "bayMax", education : String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
