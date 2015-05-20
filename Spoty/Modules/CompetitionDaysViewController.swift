//
//  CompetitionDaysViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit
import SVProgressHUD

class CompetitionDaysViewController: UITableViewController {
    
    // MARK: - Properties
    
    var competition: Competition!
    var competitionClass: CompetitionClass!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = competitionClass.name
        
        refreshControl?.addTarget(self, action: "reloadData", forControlEvents: .ValueChanged)
        
        reloadData()
    }
    
    // MARK: - Data
    
    func reloadData() {
//        SVProgressHUD.show()
//        ServiceClient().fetchCompetition(competition) { (response, error) -> () in
//            SVProgressHUD.dismiss()
//            
//            self.competition.classes = response as? [CompetitionClass]
//            self.tableView.reloadData()
//            self.refreshControl?.endRefreshing()
//        }
    }
    
}

extension CompetitionDaysViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitionClass.days?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let competitionDay = competitionClass.days?[indexPath.row]
        cell.textLabel?.text = competitionDay?.name
        cell.detailTextLabel?.text = competitionDay?.date
        return cell
    }
    
}