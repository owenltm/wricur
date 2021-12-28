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
    
    var curhatList = [Curhat]()
    var account: AccountEntity?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Dummy data
        //curhatList.append(Curhat(name: "Alex", body: "This is an example of a curhat text that is supposed to be long but i dont really prepare a sample text therefore im putting this random words as a placeholder", isHidden: false))
        // test change
        
        curhatTableView.dataSource = self
        
        context = appDelegate.persistentContainer.viewContext
        
        //saveDummy()
        //curhatList = loadCurhat()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOwned" {
            let dest = segue.destination as! OwnViewController
            
            dest.account = account
        } else if segue.identifier == "goToCreate" {
            let dest = segue.destination as! CreateViewController
            
            dest.account = account
        } else if segue.identifier == "goToProfile" {
            let dest = segue.destination as! ProfileViewController
            
            dest.account = account
        }
    }
    
    func saveDummy()->Void {
        let entity = NSEntityDescription.entity(forEntityName: "CurhatEntity", in: context)
        let newCurhat = NSManagedObject(entity: entity!, insertInto: context)
        
        newCurhat.setValue(3, forKey: "idCurhat")
        newCurhat.setValue(2, forKey: "idAccount")
        newCurhat.setValue("222 test long text in place of a curhat that i still havent prepared so i put this long text as a placeholder", forKey: "curhat")
        newCurhat.setValue(false, forKey: "isHidden")
        
        do {
            try context.save()
            print("(LOG) dummy added")
        } catch {
            print("(ERROR) Failed saving data")
        }
    }
    
    func loadCurhat()->[Curhat] {
        var fetchedCurhat = [Curhat]()
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "CurhatEntity")
        
        do {
            let results = try context.fetch(req) as! [NSManagedObject]
            
            for item in results {
                let idCurhat = item.value(forKey: "idCurhat") as! Int
                let idAccount = item.value(forKey: "idAccount") as! Int
                let curhat = item.value(forKey: "Curhat") as! String
                let isHidden = item.value(forKey: "isHidden") as! Bool
                
                fetchedCurhat.append(Curhat(idCurhat: idCurhat, idUser: idAccount, body: curhat, isHidden: isHidden))
            }
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
        
        cell.titleLbl.text = "fix this name"
        cell.subtitleLbl.text = curCurhat.body
        
        return cell
    }

}
