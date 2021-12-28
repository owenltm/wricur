//
//  HomeViewController.swift
//  wricur
//
//  Created by Owen Lwiantoro on 11/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext!
    
    @IBOutlet var curhatTableView: UITableView!
    
    var curhatList = [CurhatEntity]()
    var account: AccountEntity?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        curhatTableView.dataSource = self
        
        context = appDelegate.persistentContainer.viewContext
        
        //saveDummy()
        
        print("home of \(account?.fullname!)")
        
        curhatList = loadCurhat()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOwned" {
            let dest = segue.destination as! OwnViewController
            
            dest.account = account!
        } else if segue.identifier == "goToCreate" {
            let dest = segue.destination as! CreateViewController
            
            dest.account = account!
        } else if segue.identifier == "goToProfile" {
            let dest = segue.destination as! ProfileViewController
            
            dest.account = account!
        }
    }
    
    func saveDummy()->Void {
        var dummy1 = CurhatEntity(idCurhat: 0, curhat: "\(account?.fullname!) test long text in place of a curhat that i still havent prepared so i put this long text as a placeholder", isHidden: false)
        
        do {
            account?.addToCurhats(dummy1!)
            try dummy1?.managedObjectContext?.save()
            print("Berhasil buat dummy")
        } catch {
            print("ERROR registering account")
        }
    }
    
    func loadCurhat()->[CurhatEntity] {
        var fetchedCurhat = [CurhatEntity]()
        
        let req: NSFetchRequest<CurhatEntity> = CurhatEntity.fetchRequest()
        
        do {
            fetchedCurhat = try context.fetch(req)
        } catch {
            print("ERROR) Failed loading data")
        }
        
        return fetchedCurhat
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curhatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "curhatCell") as! CurhatTableViewCell
        
        let curCurhat = curhatList[indexPath.row]
        
        cell.titleLbl.text =  curCurhat.isHidden ? "Anonymous" : curCurhat.account?.fullname
        cell.subtitleLbl.text = curCurhat.curhat!
        
        return cell
    }

}
