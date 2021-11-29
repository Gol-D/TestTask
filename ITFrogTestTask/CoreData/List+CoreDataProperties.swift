//
//  List+CoreDataProperties.swift
//  ITFrogTestTask
//
//  Created by Daniel Golovin on 29.11.2021.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var shortName: String?
    @NSManaged public var longName: String?
    @NSManaged public var colors: NSObject?
    @NSManaged public var listArray: NSObject?

}

extension List : Identifiable {

}
