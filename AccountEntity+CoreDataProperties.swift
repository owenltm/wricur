//
//  AccountEntity+CoreDataProperties.swift
//  wricur
//
//  Created by user on 28/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//
//

import Foundation
import CoreData


extension AccountEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AccountEntity> {
        return NSFetchRequest<AccountEntity>(entityName: "AccountEntity")
    }

    @NSManaged public var idAccount: Double
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var fullname: String?
    @NSManaged public var dob: NSDate?
    @NSManaged public var curhats: NSOrderedSet?

}

// MARK: Generated accessors for curhats
extension AccountEntity {

    @objc(insertObject:inCurhatsAtIndex:)
    @NSManaged public func insertIntoCurhats(_ value: CurhatEntity, at idx: Int)

    @objc(removeObjectFromCurhatsAtIndex:)
    @NSManaged public func removeFromCurhats(at idx: Int)

    @objc(insertCurhats:atIndexes:)
    @NSManaged public func insertIntoCurhats(_ values: [CurhatEntity], at indexes: NSIndexSet)

    @objc(removeCurhatsAtIndexes:)
    @NSManaged public func removeFromCurhats(at indexes: NSIndexSet)

    @objc(replaceObjectInCurhatsAtIndex:withObject:)
    @NSManaged public func replaceCurhats(at idx: Int, with value: CurhatEntity)

    @objc(replaceCurhatsAtIndexes:withCurhats:)
    @NSManaged public func replaceCurhats(at indexes: NSIndexSet, with values: [CurhatEntity])

    @objc(addCurhatsObject:)
    @NSManaged public func addToCurhats(_ value: CurhatEntity)

    @objc(removeCurhatsObject:)
    @NSManaged public func removeFromCurhats(_ value: CurhatEntity)

    @objc(addCurhats:)
    @NSManaged public func addToCurhats(_ values: NSOrderedSet)

    @objc(removeCurhats:)
    @NSManaged public func removeFromCurhats(_ values: NSOrderedSet)

}
