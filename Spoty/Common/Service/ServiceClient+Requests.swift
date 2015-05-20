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
    
    func fetchCompetition(competition: Competition, completion: ServiceClientCompletion) {
        performFetch(URLString: "competitions/\(competition.key)") { response, error in
            var competitionClasses: [CompetitionClass]?
            if let rawCompetition: AnyObject = (response as? [String:AnyObject])?["competition"],
                let rawClasses: AnyObject = (rawCompetition as? [String:AnyObject])?["classes"] {
                    competitionClasses = [CompetitionClass]()
                    for (key, rawClass) in rawClasses as! [String:[String:AnyObject]] {
                        let competitionClass = CompetitionClass(key: key, name: rawClass["name"] as! String)
                        competitionClasses?.append(competitionClass)
                    }
            }
            completion(response: competitionClasses, error: error)
        }
    }
    
}