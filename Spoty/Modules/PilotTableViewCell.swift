//
//  PilotTableViewCell.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 26/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class PilotTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var cnLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var gliderLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    
    // MARK: - Configure
    
    func configure(#pilot: Pilot) {
        cnLabel.text = pilot.cn
        nameLabel.text = pilot.name
        gliderLabel.text = pilot.glider
        pointsLabel.text = pilot.total
    }
    
}