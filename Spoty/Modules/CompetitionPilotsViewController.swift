//
//  CompetitionPilotsViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation
import SVProgressHUD

class CompetitionPilotsViewController: UITableViewController {
    
    // MARK: - Properties
    
    var competition: Competition!
    var competitionClass: CompetitionClass!
    var pilots: [Pilot]?
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = competitionClass.name
        
        refreshControl?.addTarget(self, action: "reloadData", forControlEvents: .ValueChanged)
        
        SVProgressHUD.show()
        reloadData()
    }
    
    // MARK: - Data
    
    func reloadData() {
        ServiceClient().fetchPilots(competition, competitionClass: competitionClass) { (response, error) -> () in
            SVProgressHUD.dismiss()
            
            self.pilots = response as? [Pilot]
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let controller = segue.destinationViewController as? CompetitionDaysViewController {
//            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
//            controller.competition = competition
//            controller.competitionClass = competition.classes![indexPath.row]
//        }
    }
    
}

extension CompetitionPilotsViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pilots?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let pilot = pilots?[indexPath.row]
        let cn = pilot!.cn == nil ? "" : "\(pilot!.cn!) "
        cell.textLabel?.text = "\(cn)\(pilot!.name)"
        cell.detailTextLabel?.text = pilot?.glider
        return cell
    }
    
}