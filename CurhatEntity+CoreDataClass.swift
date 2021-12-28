//
//  CurhatEntity+CoreDataClass.swift
//  wricur
//
//  Created by user on 28/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//

import Foundation
import UIKit
import CoreData

@objc(CurhatEntity)
public class CurhatEntity: NSManagedObject {
    convenience init?(idCurhat: Double, curhat: String, isHidden: Bool) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: CurhatEntity.entity(), insertInto: context)
        
        self.idCurhat = idCurhat
        self.curhat = curhat
        self.isHidden = isHidden
    }
}
