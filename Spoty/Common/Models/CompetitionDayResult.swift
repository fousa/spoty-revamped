//
//  CompetitionDayResult.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 27/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

class CompetitionDayResult {
    
    // MARK: - Properties
    
    var sortKey: String
    var pilot: String
    var points: String?
    
    // MARK: - Init
    
    init(sortKey: String, pilot: String) {
        self.sortKey = sortKey
        self.pilot = pilot
    }
    
}

func <=(lhs: CompetitionDayResult, rhs: CompetitionDayResult) -> Bool {
    return (lhs.sortKey as NSString).integerValue <= (rhs.sortKey as NSString).integerValue
}

func >=(lhs: CompetitionDayResult, rhs: CompetitionDayResult) -> Bool {
    return (lhs.sortKey as NSString).integerValue >= (rhs.sortKey as NSString).integerValue
}

func >(lhs: CompetitionDayResult, rhs: CompetitionDayResult) -> Bool {
    return (lhs.sortKey as NSString).integerValue > (rhs.sortKey as NSString).integerValue
}

func <(lhs: CompetitionDayResult, rhs: CompetitionDayResult) -> Bool {
    return (lhs.sortKey as NSString).integerValue < (rhs.sortKey as NSString).integerValue
}

func ==(lhs: CompetitionDayResult, rhs: CompetitionDayResult) -> Bool {
    return (lhs.sortKey as NSString).integerValue == (rhs.sortKey as NSString).integerValue
}