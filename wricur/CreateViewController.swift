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
    @IBOutlet weak var Titles: UILabel!
    
    var account: AccountEntity?
    var curhat: CurhatEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextView.layer.borderColor = UIColor.black.cgColor
        TextView.layer.borderWidth = 2
        TextView.textColor = .lightGray
        TextView.text = "Write your text here"
        TextView.delegate = self
        
        if (curhat?.isHidden == true) {Reveal.isOn = true }
        else {Reveal.isOn = false
        }
        if curhat?.curhat != nil{
            Titles.text = "Edit"
            TextView.text = curhat?.curhat
        }
        if TextView.text != "Write your text here" {
            TextView.textColor = .black
         
        }
        
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
        if textView.textColor == .lightGray && textView.text == "Write your text here" {
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
    
    func alert(title:String ,msg:String, handler:((UIAlertAction)->Void)?){
        let alert = UIAlertController(title:title, message: msg, preferredStyle: .actionSheet)
        let okaction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.view.backgroundColor = UIColor.white
        alert.addAction(okaction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func Share(_ sender: Any) {
        var reveal: Bool!
        if Reveal.isOn{
            reveal = true
        }
        else {
            reveal = false
        }
        let textview = TextView.text
        var eCurhat: CurhatEntity?
        if let curhat = curhat{
            curhat.isHidden = reveal
            curhat.curhat = textview
            
            eCurhat = curhat
        }
        else {
            eCurhat = CurhatEntity(idCurhat: 1, curhat: textview!, isHidden: reveal)
        }
        
        if textview!.count < 50 {
            alert(title: "Fail", msg: "Curhat must be at least 50 characters", handler: nil)
        }
        else{
            if let curhattemp = eCurhat{
                account?.addToCurhats(curhattemp)
                do{
                    try curhattemp.managedObjectContext?.save()
                    alert(title: "Success", msg: "Curhat have been shared", handler: nil)
                    TextView.text = ""
                } catch {
                    
                }
            }
        }
        
        
    }
    
    
}
