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
    
    var curhatList = [Curhat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dummy data
        //curhatList.append(Curhat(name: "Alex", body: "This is an example of a text tht is supposed to be long but i dont really prepare a sample text therefore im putting this random words as a placeholder", isHidden: false))
        
        curhatTableView.dataSource = self
        
        context = appDelegate.persistentContainer.viewContext
        
        curhatList = loadCurhatFromId(id: 2)
    }
    
    //    TODO: GET LIST OF CURHAT FROM CORE DATA
    func loadCurhatFromId(id: Int)->[Curhat] {
        var fetchedCurhat = [Curhat]()
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "CurhatEntity")
        let predicate = NSPredicate(format: "idAccount == %@", "\(id)")
        
       req.predicate = predicate
        
        do {
            let results = try context.fetch(req) as! [NSManagedObject]
            
            for item in results {
                let idCurhat = item.value(forKey: "idCurhat") as! Int
                let idAccount = item.value(forKey: "idAccount") as! Int
                let curhat = item.value(forKey: "Curhat") as! String
                let isHidden = item.value(forKey: "isHidden") as! Bool
                
                fetchedCurhat.append(Curhat(idCurhat: idCurhat, idUser: idAccount, body: curhat, isHidden: isHidden))
                
                print("(FETCHED) \(idCurhat)")
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
