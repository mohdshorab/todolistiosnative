//
//  TaskEntity+CoreDataProperties.swift
//  To-Do List
//
//  Created by Mohd Shorab on 16/08/24.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var taskDesc: String?
    @NSManaged public var isCompleted: Bool

}

extension TaskEntity : Identifiable {

}
