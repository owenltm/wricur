//
//  Login Scene.swift
//  wricur
//
//  Created by prk on 18/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class Login_Scene: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    
    var account: AccountEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
        
        printAllUser()
    }
    
    func dismissKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboard()
    }
    
    @IBAction func editingEnd(_ sender: Any) {
        dismissKeyboard()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let dest = segue.destination as! HomeViewController
            
            dest.account = account!
        }
    }
    
    @IBAction func unwindToLogin(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    func alert(title:String ,msg:String, handler:((UIAlertAction)->Void)?){
        let alert = UIAlertController(title:title, message: msg, preferredStyle: .actionSheet)
        let okaction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.view.backgroundColor = UIColor.white
        alert.addAction(okaction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func doLogin(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
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
        
        if valid {
            let req: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
            let predicate = NSPredicate(format: "email == %@", "\(email)")
            
            req.predicate = predicate
            
            do {
                let results = try context.fetch(req)
                
                if results.count > 0 {
                    for item in results {
                        if item.password == password {
                            //email ada passwordnya bener
                            
                            //print("Berhasil Login")
                            account = item
                            performSegue(withIdentifier: "goToHome", sender: self)
                            
                            return
                        } else {
                            print("password salah")
                            alert(title: "Failed", msg: "Invalid username/password", handler: nil)
                        }
                    }
                }
                
                alert(title: "Failed", msg: "Invalid username/password", handler: nil)
                
            } catch {
                print("ERROR) Failed loading data")
            }
        }
        
    }
    
    func printAllUser() {
        let req: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        
        do {
            let results = try context.fetch(req)
            
            for item in results {
                print("\(item.email as! String) \(item.password as! String)")
            }
        } catch {
            print("ERROR) Failed loading data")
        }
    }
}
