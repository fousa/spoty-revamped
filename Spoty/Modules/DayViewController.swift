//
//  DayViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class DayViewController: UITabBarController {
    
    // MARK: - Properties
    
    var day: CompetitionDay!
    
    // MARK: - View flow
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disableLandscape()
    }
    
    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? DayDailyViewController {
            controller.day = day
        }
    }
    
}