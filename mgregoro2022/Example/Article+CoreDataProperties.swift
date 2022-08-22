//
//  Article+CoreDataProperties.swift
//  Pods
//
//  Created by Мадина Кадырова on 8/22/22.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: String?
    @NSManaged public var creation_date: Date?
    @NSManaged public var modification_date: Date?
    
    override public var description: String {
        return "article:\n\(title!) in \(language!) language\n\(content!)\ncreated: \(creationDate!) | modified: \(modificationDate!)"
    }

}
