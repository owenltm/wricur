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
        
        //validasi form
        
        var newAccount = AccountEntity(idAccount: 0.0, email: email, password: password, fullname: fullname, dob: dob)
        
        do {
            try newAccount?.managedObjectContext?.save()
            print("Berhasil register")
        } catch {
            print("ERROR registering account")
        }
    }
    

}
