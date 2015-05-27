//
//  DayViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit
import SVProgressHUD

class DayViewController: UITabBarController {
    
    // MARK: - Properties
    
    var competition: Competition!
    var competitionClass: CompetitionClass!
    var competitionDay: CompetitionDay!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = competitionDay.name
        
        SVProgressHUD.show()
        reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        disableLandscape()
    }
    
    // MARK: - Data
    
    func reloadData() {
        ServiceClient().fetchDay(competition, competitionClass: competitionClass, competitionDay: competitionDay) { response, error in
            SVProgressHUD.dismiss()
            
            if let dailyViewController = self.viewControllers?.first as? DayDailyViewController {
                dailyViewController.competitionDay = response as? CompetitionDay
                dailyViewController.reloadData()
            }
        }
    }
    
}