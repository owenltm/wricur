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
    
    var account: AccountEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.layer.borderColor = UIColor.black.cgColor
        TextView.layer.borderWidth = 2
        TextView.textColor = .lightGray
        TextView.text = "Write your text here"
        TextView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let dest = segue.destination as! HomeViewController
            
            dest.account = account
        } else if segue.identifier == "goToOwned" {
            let dest = segue.destination as! OwnViewController
            
            dest.account = account
        } else if segue.identifier == "goToProfile" {
            let dest = segue.destination as! ProfileViewController
            
            dest.account = account
        }
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
