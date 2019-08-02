//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by Vinte on 2019/8/2.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let width = UIScreen.main.bounds.size.width
    let cornerRadius = 5.0
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var titleLayoutCon: NSLayoutConstraint!
    
    @IBOutlet weak var loginButtonLayoutCon: NSLayoutConstraint!
    @IBOutlet weak var passwordLayoutCon: NSLayoutConstraint!
    @IBOutlet weak var userNameLayoutCon: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLayoutCon.constant         -= width
        userNameLayoutCon.constant      -= width
        passwordLayoutCon.constant      -= width
        loginButtonLayoutCon.constant   -= width
        loginButton.alpha = 0.0
        
        userNameField.layer.cornerRadius    = CGFloat(cornerRadius)
        passwordField.layer.cornerRadius    = CGFloat(cornerRadius)
        loginButton.layer.cornerRadius      = CGFloat(cornerRadius)
            }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    func startAnimation() {
        
        unowned let weakSelf = self
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseIn, animations: {
            weakSelf.titleLayoutCon.constant += weakSelf.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseIn, animations: {
            weakSelf.userNameLayoutCon.constant += weakSelf.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 1.6, options: .curveEaseIn, animations: {
            weakSelf.passwordLayoutCon.constant += weakSelf.width
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 2.0, options: .curveEaseInOut, animations: {
            weakSelf.loginButtonLayoutCon.constant += weakSelf.width
            weakSelf.loginButton.alpha = 1.0
        }, completion: nil)
    }
    
    @IBAction func backButtonEvent(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginButtonEvent(_ sender: Any) {
        let bounds = self.loginButton.bounds

        if self.userNameField.text!.count <= 0 || self.passwordField.text!.count <= 0 {
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
                self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                self.loginButton.isEnabled = false
            }) { (finished) in
                self.loginButton.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
                self.loginButton.isEnabled = true
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.userNameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
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
