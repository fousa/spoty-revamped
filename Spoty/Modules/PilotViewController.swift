//
//  PilotViewController.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class PilotViewController: UITableViewController {
    
    // MARK: - Properties
    
    var pilot: Pilot!
    
    // MARK: - View flow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = pilot.name
    }
    
}

extension PilotViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pilot.results?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let result = pilot.results?[indexPath.row]
        cell.textLabel?.text = result!.day
        cell.detailTextLabel?.text = result!.points
        return cell
    }
    
}