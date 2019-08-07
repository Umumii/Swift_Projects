//
//  MenuViewController.swift
//  TumblrMenu
//
//  Created by Vinte1 on 2019/8/7.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {
    
    let transitionManager = MenuTransitionManager()

    @IBOutlet weak var textImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var audioLabel: UILabel!
    @IBOutlet weak var audioButton: UIImageView!
    
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var chatButton: UIImageView!
    
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var linkButton: UIImageView!
    
    @IBOutlet weak var photoButton: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!

    @IBOutlet weak var quoteButton: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.transitioningDelegate = self.transitionManager
    }
    
    @IBAction func buttonEvent(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
