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
                        if let rawDays = rawClass["days"] as? [String:[String:String]] {
                            competitionClass.days = [CompetitionDay]()
                            for (key, rawDay) in rawDays {
                                let competitionDay = CompetitionDay(key: rawDay["key"], name: rawDay["name"]!, date: rawDay["date"]!, sortKey: key)
                                competitionClass.days?.append(competitionDay)
                            }
                            sort(&competitionClass.days!) { $0 < $1 }
                        }
                        competitionClasses?.append(competitionClass)
                    }
            }
            completion(response: competitionClasses, error: error)
        }
    }
    
    // MARK: - Days
    
    func fetchDay(competition: Competition, competitionClass: CompetitionClass, competitionDay: CompetitionDay, completion: ServiceClientCompletion) {
        performFetch(URLString: "competitions/\(competition.key)/classes/\(competitionClass.key)/days/\(competitionDay.key!)") { response, error in
            var results: [CompetitionDayResult]?
            if let rawDay: AnyObject = (response as? [String:AnyObject])?["day"] {
                if let rawResults: AnyObject = rawDay["daily"] {
                    results = [CompetitionDayResult]()
                    for rawResult in rawResults as! [[String:AnyObject]] {
                        var result = CompetitionDayResult(sortKey: (rawResult["#"] as! NSNumber).stringValue, pilot: rawResult["pilot"] as! String)
                        results?.append(result)
                    }
                    sort(&results!) { $0 < $1 }
                }
            }
            competitionDay.results = results
            completion(response: competitionDay, error: error)
        }
    }
    
    // MARK: - Pilots
    
    func fetchPilots(competition: Competition, competitionClass: CompetitionClass, completion: ServiceClientCompletion) {
        performFetch(URLString: "competitions/\(competition.key)/classes/\(competitionClass.key)/pilots") { response, error in
            var pilots: [Pilot]?
            if let rawPilots: AnyObject = (response as? [String:AnyObject])?["pilots"] {
                    pilots = [Pilot]()
                    for rawPilot in rawPilots as! [[String:AnyObject]] {
                        var pilot = Pilot(name: rawPilot["info"]!["pilot"] as! String, sortKey: (rawPilot["info"]!["#"] as! NSNumber).stringValue)
                        pilot.glider = rawPilot["info"]!["glider"] as? String
                        pilot.cn = rawPilot["info"]!["cn"] as? String
                        pilot.team = rawPilot["info"]!["team"] as? String
                        pilot.total = rawPilot["info"]!["total"] as? String
                        if let rawResults = rawPilot["results"] as? [String:String] {
                            pilot.results = [PilotResult]()
                            for (key, value) in rawResults {
                                let result = PilotResult(day: key, points: value)
                                pilot.results?.append(result)
                            }
                            sort(&pilot.results!) { $0 < $1 }
                        }
                        sort(&pilots!) { $0 < $1 }
                        pilots?.append(pilot)
                    }
            }
            completion(response: pilots, error: error)
        }
    }
    
}