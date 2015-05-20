//
//  Competition.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

class Competition {
    
    // MARK: - Properties
    
    var key: String
    var name: String
    
    var classes: [CompetitionClass]?
    
    // MARK: - Init
    
    init(key: String, name: String) {
        self.key = key
        self.name = name
    }
    
}