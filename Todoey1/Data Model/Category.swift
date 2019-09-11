//
//  Category.swift
//  Todoey1
//
//  Created by MooMyeong on 10/09/2019.
//  Copyright © 2019 Pymco. All rights reserved.
//

import Foundation
import RealmSwift



class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
