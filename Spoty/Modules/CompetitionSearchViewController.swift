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
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? CompetitionClassesViewController {
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            controller.competition = competitions![indexPath.row]
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

extension CompetitionSearchViewController: UITableViewDelegate {

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        let competition = competitions?[indexPath.row]
        var actions = [UITableViewRowAction]()
        if Favorite.exists(competition: competition!) {
            actions.append(UITableViewRowAction(style: .Normal, title: "Unfavorite") { action, indexPath in
                Favorite.unfavorite(competition: competition!)
                self.tableView.setEditing(false, animated: true)
            })
        } else {
            actions.append(UITableViewRowAction(style: .Normal, title: "Favorite") { action, indexPath in
                Favorite.favorite(competition: competition!)
                self.tableView.setEditing(false, animated: true)
            })
        }
        return actions
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}