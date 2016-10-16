//
//  MemoStore+CoreDataProperties.swift
//  StorageTest
//
//  Created by Shusuke Unno on 2016/09/07.
//  Copyright © 2016年 Shusuke Unno. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MemoStore {

    @NSManaged var date: NSDate?
    @NSManaged var memo: String?
    @NSManaged var name: String?

}
