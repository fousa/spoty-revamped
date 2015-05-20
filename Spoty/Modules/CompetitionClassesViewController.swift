//
//  CompetitionClassesViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit
import SVProgressHUD

class CompetitionClassesViewController: UITableViewController {
    
    // MARK: - Properties
    
    var competition: Competition!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = competition.name
        
        refreshControl?.addTarget(self, action: "reloadData", forControlEvents: .ValueChanged)
        
        reloadData()
    }
    
    // MARK: - Data
    
    func reloadData() {
        SVProgressHUD.show()
        ServiceClient().fetchCompetition(competition) { (response, error) -> () in
            SVProgressHUD.dismiss()
            
            self.competition.classes = response as? [CompetitionClass]
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? CompetitionDaysViewController {
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            controller.competition = competition
            controller.competitionClass = competition.classes![indexPath.row]
        }
    }
    
}

extension CompetitionClassesViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return competition.classes?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let competitionClass = competition.classes?[indexPath.row]
        cell.textLabel?.text = competitionClass?.name
        return cell
    }
    
}