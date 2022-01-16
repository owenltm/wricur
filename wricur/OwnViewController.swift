//
//  OwnViewController.swift
//  wricur
//
//  Created by Owen Lwiantoro on 11/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class OwnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    
    @IBOutlet var curhatTableView: UITableView!
    
    var curhatList = [CurhatEntity]()
    var account2 = [AccountEntity]()
    var account: AccountEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curhatTableView.dataSource = self
        curhatTableView.delegate = self
        context = appDelegate.persistentContainer.viewContext
     
        curhatList = loadOwnedCurhat()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fecthRequest: NSFetchRequest<AccountEntity> = AccountEntity.fetchRequest()
//
       
        curhatList = loadOwnedCurhat()
        self.curhatTableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let dest = segue.destination as! HomeViewController
            
            dest.account = account
        } else if segue.identifier == "goToCreate" {
            let dest = segue.destination as! CreateViewController
            
            dest.account = account
        } else if segue.identifier == "goToProfile" {
            let dest = segue.destination as! ProfileViewController
            
            dest.account = account
        } else if segue.identifier == "goToEdit" {
            let dest = segue.destination as! CreateViewController
            let selectedRow = self.curhatTableView.indexPathForSelectedRow?.row
            dest.curhat = account!.curhatList?[selectedRow!]
            dest.account = account
        }
        
    }
    
    func loadOwnedCurhat()->[CurhatEntity] {
        if let fetchedCurhat = account?.curhatList {
            for item in fetchedCurhat {
                print(item.account!.fullname! as String)
            }
            
            return fetchedCurhat
        } else {
            print("Welp")
            return [CurhatEntity]()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToEdit", sender: self)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteCurhat(at: indexPath)
        }
    }
    
    func deleteCurhat(at indexPath: IndexPath){
        let DCurhat = account?.curhatList?[indexPath.row]
        
        let managedContext = DCurhat!.managedObjectContext
        managedContext!.delete(DCurhat!)
        do {
            try managedContext!.save()
            curhatList = loadOwnedCurhat()

            curhatTableView.reloadData()
        } catch  {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curhatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "curhatCell") as! CurhatTableViewCell
        
        let curCurhat = curhatList[indexPath.row]
        
        cell.titleLbl.text =  curCurhat.isHidden ? curCurhat.account?.fullname : "Anonymous"
        cell.subtitleLbl.text = curCurhat.curhat
        
        return cell
    }
}
