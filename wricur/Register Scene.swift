//
//  Register Scene.swift
//  wricur
//
//  Created by prk on 18/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class Register_Scene: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    @IBOutlet var fullnameTextField: UITextField!
    @IBOutlet var dobDatePicker: UIDatePicker!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        fullnameTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    @IBAction func editingEnd(_ sender: Any) {
        dismissKeyboard()
    }
    
    func alert(title:String ,msg:String, handler:((UIAlertAction)->Void)?){
        let alert = UIAlertController(title:title, message: msg, preferredStyle: .actionSheet)
        let okaction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.view.backgroundColor = UIColor.white
        alert.addAction(okaction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        let fullname = fullnameTextField.text!
        let dob = dobDatePicker.date
        
        let userCount = defaults.double(forKey: "userCount")
        
        var valid = true
        
        //validasi form
        if !email.contains("@") {
            valid = false
            alert(title: "Invalid email", msg: "Email must be valid", handler: nil)
        }
        
        if password.count < 8 {
            valid = false
            alert(title: "Invalid password", msg: "Password must be atleast 8 characters", handler: nil)
        }
        
        if !Helper.haveAlpha(str: password) || !Helper.haveDigit(str: password){
            valid = false
            alert(title: "Invalid password", msg: "Password must contain characters and numbers", handler: nil)
        }
        
        if confirmPassword != password {
            valid = false
            alert(title: "Invalid confim password", msg: "Confirm password must match password", handler: nil)
        }
        
        if fullname.count < 8 {
            valid = false
            alert(title: "Invalid username", msg: "username must be atleast 8 characters", handler: nil)
        }
        
        if Helper.getYearDiff(date1: dob, date2: Date()) < 13 {
            valid = false
            alert(title: "Invalid date of birth", msg: "You must be atleast 13 years old to use this app", handler: nil)
        }
        
        var newAccount = AccountEntity(idAccount: userCount, email: email, password: password, fullname: fullname, dob: dob)
        
        if valid {
            do {
                try newAccount?.managedObjectContext?.save()
                defaults.setValue(userCount + 1, forKey: "userCount")
                print("Berhasil register")
                
                performSegue(withIdentifier: "unwindToLogin", sender: self)
            } catch {
                print("ERROR registering account")
            }
        }
    }
    

}
