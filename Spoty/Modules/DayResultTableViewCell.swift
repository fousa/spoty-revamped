//
//  DayResultTableViewCell.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 27/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class DayResultTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    
    // MARK: - Configure
    
    func configure(#competitionDayResult: CompetitionDayResult) {
        placeLabel.text = competitionDayResult.sortKey
        nameLabel.text = competitionDayResult.pilot
        pointsLabel.text = competitionDayResult.points
    }
    
}