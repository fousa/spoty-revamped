//
//  CompetitionSearchTableViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class CompetitionSearchTableViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    
    private var competitions: [Competition]?

    // MARK: - View flow
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ServiceClient().fetchRecentCompetitions { (response, error) -> () in
            self.competitions = response as? [Competition]
            self.tableView.reloadData()
        }
    }

}

extension CompetitionSearchTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitions?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let competition = competitions?[indexPath.row]
        cell.textLabel?.text = competition?.name
        return cell
    }
    
}