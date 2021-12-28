//
//  OwnViewController.swift
//  wricur
//
//  Created by Owen Lwiantoro on 11/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class OwnViewController: UIViewController, UITableViewDataSource {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    
    @IBOutlet var curhatTableView: UITableView!
    
    var curhatList = [CurhatEntity]()
    var account: AccountEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        curhatTableView.dataSource = self
        
        context = appDelegate.persistentContainer.viewContext
        
        print("loading curhat from \(account?.fullname)")
        
        curhatList = loadOwnedCurhat()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curhatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "curhatCell") as! CurhatTableViewCell
        
        let curCurhat = curhatList[indexPath.row]
        
        cell.titleLbl.text =  curCurhat.isHidden ? "Anonymous" : curCurhat.account?.fullname
        cell.subtitleLbl.text = curCurhat.curhat
        
        return cell
    }
}
