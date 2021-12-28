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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let dest = segue.destination as! HomeViewController
            
            dest.account = account!
        }
    }
    
    @IBAction func doLogin(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let req: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
        let predicate = NSPredicate(format: "email == %@", "\(email)")
        
        req.predicate = predicate
        
        do {
            let results = try context.fetch(req)
            
            for item in results {
                if item.password == password {
                    //email ada passwordnya bener
                    
                    //print("Berhasil Login")
                    account = item
                    performSegue(withIdentifier: "goToHome", sender: self)
                } else {
                    print("password salah")
                }
            }
        } catch {
            print("ERROR) Failed loading data")
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
