//
//  PhotoEntity+CoreDataProperties.swift
//  PexelCloneApp
//
//  Created by Tiparpron Sukanya on 11/17/23.
//
//

import Foundation
import CoreData


extension PhotoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoEntity> {
        return NSFetchRequest<PhotoEntity>(entityName: "PhotoEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var photoId: String?
    @NSManaged public var photographerName: String?
    @NSManaged public var imagePath: String?

}

extension PhotoEntity : Identifiable {

}
