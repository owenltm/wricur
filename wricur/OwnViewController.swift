//
//  OwnViewController.swift
//  wricur
//
//  Created by Owen Lwiantoro on 11/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class OwnViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var curhatTableView: UITableView!
    
    var curhatList = [Curhat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dummy data
        curhatList.append(Curhat(name: "Alex", body: "This is an example of a text tht is supposed to be long but i dont really prepare a sample text therefore im putting this random words as a placeholder", isHidden: false))
        curhatList.append(Curhat(name: "Kevin", body: "This is an example of a text tht is supposed to be long but i dont really prepare a sample text therefore im putting this random words as a placeholder", isHidden: true))
        
        curhatTableView.dataSource = self
    }
    
    //    TODO: GET LIST OF CURHAT FROM CORE DATA
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curhatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "curhatCell") as! CurhatTableViewCell
        
        let curCurhat = curhatList[indexPath.row]
        
        cell.titleLbl.text = curCurhat.isHidden ? "Anonymous" : curCurhat.name
        cell.subtitleLbl.text = curCurhat.body
        
        return cell
    }
}
