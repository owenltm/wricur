//
//  CreateViewController.swift
//  wricur
//
//  Created by Andy Chen on 07/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var Reveal: UISwitch!
    @IBOutlet weak var TextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.layer.borderColor = UIColor.black.cgColor
        TextView.layer.borderWidth = 2
        TextView.textColor = .lightGray
        TextView.text = "Write your text here"
        TextView.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        TextView.resignFirstResponder()
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.textColor = .lightGray
            textView.text = "Write your text here"
        }
    }
    
    @IBAction func Share(_ sender: Any) {
    }
    
    
}
