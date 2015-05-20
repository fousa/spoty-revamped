//
//  Pilot.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

class Pilot {
    
    // MARK: - Properties
    
    var sortKey: String
    var name: String
    var team: String?
    var glider: String?
    var cn: String?
    var total: String?
    
    var results: [PilotResult]?
    
    // MARK: - Init
    
    init(name: String, sortKey: String) {
        self.name = name
        self.sortKey = sortKey
    }
    
}