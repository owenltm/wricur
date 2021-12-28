//
//  AccountEntity+CoreDataClass.swift
//  wricur
//
//  Created by user on 28/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//

import Foundation
import UIKit
import CoreData

@objc(AccountEntity)
public class AccountEntity: NSManagedObject {
    convenience init?(idAccount: Double, email: String, password: String, fullname: String, dob: Date) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: AccountEntity.entity(), insertInto: context)
        
        self.idAccount = idAccount
        self.email = email
        self.password = password
        self.fullname = fullname
        self.dob = dob as NSDate?
    }
}
