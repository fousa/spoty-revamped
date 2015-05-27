//
//  DayDailyViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class DayDailyViewController: UITableViewController {
    
    // MARK: - Properties
    
    var competitionDay: CompetitionDay?
    
    // MARK: - Reload
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

extension DayDailyViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitionDay?.results?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let result = competitionDay?.results?[indexPath.row]
        cell.textLabel?.text = result?.sortKey
        cell.detailTextLabel?.text = result?.pilot
        return cell
    }
    
}