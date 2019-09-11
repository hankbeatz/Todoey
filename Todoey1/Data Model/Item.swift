//
//  Item.swift
//  Todoey1
//
//  Created by MooMyeong on 10/09/2019.
//  Copyright © 2019 Pymco. All rights reserved.
//

import Foundation
import RealmSwift



class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
