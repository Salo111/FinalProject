//
//  Review.swift
//  FinalProject
//
//  Created by salo khizanishvili on 16.09.22.
//

import CoreData

@objc(MovieReview)
class MovieReview: NSManagedObject {
    @NSManaged var title: String!
    @NSManaged var reviewText: String!
    @NSManaged var delete: Date?
    @NSManaged var id: NSNumber!
}

