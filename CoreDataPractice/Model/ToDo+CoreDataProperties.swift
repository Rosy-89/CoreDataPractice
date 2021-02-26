//
//  ToDo+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Alok Kumar Naik on 23/02/2021.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var dueDate: Date?
    @NSManaged public var completedDate: Date?
    @NSManaged public var completed: Bool

}

extension ToDo : Identifiable {

}
