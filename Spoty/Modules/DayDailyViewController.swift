//
//  DayDailyViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class DayDailyViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    
    var competitionDay: CompetitionDay?
    
    private var refreshControl: UIRefreshControl!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshData", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    // MARK: - Reload
    
    func reloadData() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func refreshData() {
        if let controller = tabBarController as? DayViewController {
            controller.reloadData()
        }
    }
    
}

extension DayDailyViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competitionDay?.results?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DayResultTableViewCell
        let result = competitionDay?.results?[indexPath.row]
        cell.configure(competitionDayResult: result!)
        return cell
    }
    
}