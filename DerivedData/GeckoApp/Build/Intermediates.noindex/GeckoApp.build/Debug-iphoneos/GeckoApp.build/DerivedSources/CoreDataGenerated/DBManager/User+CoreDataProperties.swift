//
//  User+CoreDataProperties.swift
//  
//
//  Created by Denis Vásquez on 8/27/20.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var pass: String?

}
