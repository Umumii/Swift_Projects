//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Vinte on 2019/7/22.
//  Copyright © 2019 vinte. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet var backImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    var product : Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backImageView.image = UIImage.init(named: product!.fullscreenImageName!)
        nameLabel.text = product!.name
    }
    
    @IBAction func buttonEvent(_ sender: Any) {
        print("Add success")
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
