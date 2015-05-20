//
//  Favorite.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit
import CoreData

@objc(Favorite)
class Favorite: NSManagedObject {
    
    // MARK: - Properties
    
    @NSManaged var key: NSString?
    @NSManaged var name: NSString?
    
}
