//
//  Macros.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

func enabledLandscape() {
    if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
        appDelegate.landscapeEnabled = true
    }
}

func disableLandscape() {
    if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
        appDelegate.landscapeEnabled = false
    }
}