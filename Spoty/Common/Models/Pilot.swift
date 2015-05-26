//
//  Pilot.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

class Pilot: Comparable {
    
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

func <=(lhs: Pilot, rhs: Pilot) -> Bool {
    return (lhs.sortKey as NSString).integerValue <= (rhs.sortKey as NSString).integerValue
}

func >=(lhs: Pilot, rhs: Pilot) -> Bool {
    return (lhs.sortKey as NSString).integerValue >= (rhs.sortKey as NSString).integerValue
}

func >(lhs: Pilot, rhs: Pilot) -> Bool {
    return (lhs.sortKey as NSString).integerValue > (rhs.sortKey as NSString).integerValue
}

func <(lhs: Pilot, rhs: Pilot) -> Bool {
    return (lhs.sortKey as NSString).integerValue < (rhs.sortKey as NSString).integerValue
}

func ==(lhs: Pilot, rhs: Pilot) -> Bool {
    return (lhs.sortKey as NSString).integerValue == (rhs.sortKey as NSString).integerValue
}