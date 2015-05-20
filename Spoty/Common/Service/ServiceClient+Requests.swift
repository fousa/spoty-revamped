//
//  ServiceClient+Requests.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import Foundation

extension ServiceClient {
    
    // MARK: - Competitions
    
    func fetchRecentCompetitions(completion: ServiceClientCompletion) {
        performFetch(URLString: "competitions") { response, error in
            var competitions: [Competition]?
            if let rawCompetitions: AnyObject = (response as? [String:AnyObject])?["competitions"],
                let rawRecent: AnyObject = (rawCompetitions as? [String:AnyObject])?["recent"] {
                    competitions = [Competition]()
                    for (key, rawCompetition) in rawRecent as! [String:[String:String]] {
                        let competition = Competition(key: key, name: rawCompetition["name"]!)
                        competitions?.append(competition)
                    }

            }
            completion(response: competitions, error: error)
        }
    }
    
}