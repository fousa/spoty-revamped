//
//  CompetitionSearchViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class CompetitionSearchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    
    private var competitions: [Competition]?
    private var refreshControl: UIRefreshControl!

    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "reloadData", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
    }
    
    // MARK: - Data
    
    func reloadData() {
        ServiceClient().fetchRecentCompetitions { (response, error) -> () in
            self.competitions = response as? [Competition]
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }

}

extension CompetitionSearchViewController: UITableViewDataSource {
    
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