//
//  VTNewsTableViewCell.swift
//  SlideMeun
//
//  Created by Vinte on 2019/8/6.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class VTNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var subContentLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        headImageView.layer.cornerRadius = headImageView.frame.width / 2
        headImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
