//
//  AppDelegate.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit
import AERecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var landscapeEnabled: Bool = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Setup core data.
        AERecord.loadCoreDataStack()
        
        return true
    }
    
    // MARK: - Orientation
    
    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> Int {
        return Int(landscapeEnabled ? UIInterfaceOrientationMask.All.rawValue : UIInterfaceOrientationMask.Portrait.rawValue)
    }

}

