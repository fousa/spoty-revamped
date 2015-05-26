//
//  CompetitionDay.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

class CompetitionDay: Comparable {
    
    // MARK: - Properties
    
    var key: String?
    var name: String
    var date: String
    var sortKey: String
    
    // MARK: - Init
    
    init(key: String?, name: String, date: String, sortKey: String) {
        self.key = key
        self.name = name
        self.date = date
        self.sortKey = sortKey
    }
    
}

func <=(lhs: CompetitionDay, rhs: CompetitionDay) -> Bool {
    return (lhs.sortKey as NSString).integerValue <= (rhs.sortKey as NSString).integerValue
}

func >=(lhs: CompetitionDay, rhs: CompetitionDay) -> Bool {
    return (lhs.sortKey as NSString).integerValue >= (rhs.sortKey as NSString).integerValue
}

func >(lhs: CompetitionDay, rhs: CompetitionDay) -> Bool {
    return (lhs.sortKey as NSString).integerValue > (rhs.sortKey as NSString).integerValue
}

func <(lhs: CompetitionDay, rhs: CompetitionDay) -> Bool {
    return (lhs.sortKey as NSString).integerValue < (rhs.sortKey as NSString).integerValue
}

func ==(lhs: CompetitionDay, rhs: CompetitionDay) -> Bool {
    return (lhs.sortKey as NSString).integerValue == (rhs.sortKey as NSString).integerValue
}