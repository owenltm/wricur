//
//  CurhatEntity+CoreDataProperties.swift
//  wricur
//
//  Created by user on 28/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//

import Foundation
import CoreData


extension CurhatEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurhatEntity> {
        return NSFetchRequest<CurhatEntity>(entityName: "CurhatEntity")
    }

    @NSManaged public var curhat: String?
    @NSManaged public var idCurhat: Double
    @NSManaged public var isHidden: Bool
    @NSManaged public var account: AccountEntity?

}
