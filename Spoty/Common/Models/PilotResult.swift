//
//  PilotResult.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

class PilotResult {
    
    // MARK: - Properties
    
    var day: String
    var points: String
    
    // MARK: - Init
    
    init(day: String, points: String) {
        self.day = day
        self.points = points
    }
    
}

func <=(lhs: PilotResult, rhs: PilotResult) -> Bool {
    return (lhs.day as NSString).integerValue <= (rhs.day as NSString).integerValue
}

func >=(lhs: PilotResult, rhs: PilotResult) -> Bool {
    return (lhs.day as NSString).integerValue >= (rhs.day as NSString).integerValue
}

func >(lhs: PilotResult, rhs: PilotResult) -> Bool {
    return (lhs.day as NSString).integerValue > (rhs.day as NSString).integerValue
}

func <(lhs: PilotResult, rhs: PilotResult) -> Bool {
    return (lhs.day as NSString).integerValue < (rhs.day as NSString).integerValue
}

func ==(lhs: PilotResult, rhs: PilotResult) -> Bool {
    return (lhs.day as NSString).integerValue == (rhs.day as NSString).integerValue
}