//
//  CompetitionDaysViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class CompetitionDaysViewController: UITableViewController {
    
    // MARK: - Properties
    
    var competition: Competition!
    var competitionClass: CompetitionClass!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = competitionClass.name
        
        refreshControl?.addTarget(self, action: "reloadData", forControlEvents: .ValueChanged)
    }
    
    // MARK: - Data
    
    func reloadData() {
        ServiceClient().fetchCompetition(competition) { (response, error) -> () in
            self.competition.classes = response as? [CompetitionClass]
            if let competitionClasses = self.competition.classes {
                self.competitionClass = competitionClasses.filter {
                    return $0.key == self.competitionClass.key
                }.first!
            }
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
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