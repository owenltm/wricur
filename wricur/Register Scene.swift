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
    
    @IBAction func register(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        let fullname = fullnameTextField.text!
        let dob = dobDatePicker.date
        
        let userCount = defaults.double(forKey: "userCount")
        
        //validasi form
        
        var newAccount = AccountEntity(idAccount: userCount, email: email, password: password, fullname: fullname, dob: dob)
        
        do {
            try newAccount?.managedObjectContext?.save()
            defaults.setValue(userCount + 1, forKey: "userCount")
            print("Berhasil register")
        } catch {
            print("ERROR registering account")
        }
    }
    

}
