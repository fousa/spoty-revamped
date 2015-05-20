//
//  CompetitionFavoritesViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class CompetitionFavoritesViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    
    private var favorites: [Favorite]?
    
    // MARK: - View flow
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        reloadData()
    }
    
    // MARK: - Data
    
    func reloadData() {
        favorites = Favorite.all()
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? CompetitionClassesViewController {
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            let favorite = favorites![indexPath.row]
            controller.competition = favorite.competition
        }
    }
    
}

extension CompetitionFavoritesViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let favorite = favorites?[indexPath.row]
        cell.textLabel?.text = favorite?.name as? String
        return cell
    }
    
}

extension CompetitionFavoritesViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        if let favorite = favorites?[indexPath.row] {
            return [UITableViewRowAction(style: .Normal, title: "Unfavorite") { action, indexPath in
                favorite.unfavorite()
                self.favorites?.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }]
        } else {
            return nil
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}