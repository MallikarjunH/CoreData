//
//  Student+CoreDataProperties.swift
//  CoreData_YogeshPatel
//
//  Created by mallikarjun on 27/09/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: String?
    @NSManaged public var state: String?

}
