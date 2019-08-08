//
//  ViewController.swift
//  LimitCharacters
//
//  Created by Vinte1 on 2019/8/8.
//  Copyright © 2019 Vinte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var toolBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.headImageView.layer.cornerRadius = 30;
        self.textView.text = ""
        
        self.textView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    @objc func keyboardAppear(_ note:NSNotification) {
        let userInfo  = note.userInfo
        let keyBoardBounds = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let deltaY = keyBoardBounds.size.height
        let animations = {
            self.toolBar.transform = CGAffineTransform(translationX: 0, y: -deltaY)
        }
        
        if duration > 0 {
            // 莫名其妙的一段代码, 左移16位能看出来是个啥值吗
            // let options = UIView.AnimationOptions(rawValue: UInt((userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        }else {
            animations()
        }
    }
    
    @objc func keyboardDisappear(_ note:NSNotification) {
        let userInfo  = note.userInfo
        let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations = {
            self.toolBar.transform = .identity
        }
        
        if duration > 0 {
            // let options = UIView.AnimationOptions(rawValue: UInt((userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options:[.beginFromCurrentState, .curveLinear], animations: animations, completion: nil)
        }else{
            animations()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension ViewController : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTextLength = text.count - range.length + textView.text.count
        if inputTextLength > 140 {
            return false
        }
        numberLabel.text = "\(140 - inputTextLength)"
        return true
    }
}
