//
//  User+CoreDataProperties.swift
//  CoreData_KiloLoco
//
//  Created by mallikarjun on 09/08/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String

}
