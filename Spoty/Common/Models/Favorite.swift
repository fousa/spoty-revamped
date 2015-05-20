//
//  Favorite.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit
import CoreData
import AERecord

@objc(Favorite)
class Favorite: NSManagedObject {
    
    // MARK: - Properties
    
    @NSManaged var key: NSString?
    @NSManaged var name: NSString?
    
    class func favorite(#competition: Competition) {
        if let model = Favorite.firstOrCreateWithAttribute("key", value: competition.key) as? Favorite {
            model.name = competition.name
            AERecord.saveContextAndWait()
        }
    }
    
    class func unfavorite(#competition: Competition) {
        if let model = Favorite.firstWithAttribute("key", value: competition.key) as? Favorite {
            model.delete()
            AERecord.saveContextAndWait()
        }
    }
    
    class func exists(#competition: Competition) -> Bool {
        return Favorite.firstWithAttribute("key", value: competition.key) as? Favorite != nil
    }
    
}
