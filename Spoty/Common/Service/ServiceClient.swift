//
//  ServiceClient.swift
//  Spoty
//
//  Created by Jelle Vandenbeeck on 20/05/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

typealias ServiceClientCompletion = (response: AnyObject?, error: NSError?) -> ()

class ServiceClient: NSObject {
    
    // MARK: - Globals
    
    private let baseURL = NSURL(string: "http://soaringspot.fousa.be/api")
    private let useDummy = false
    
    // MARK: - Properties
    
    private var configuration: NSURLSessionConfiguration
    private var session: NSURLSession?
    
    // MARK: - Init
    
    override init() {
        configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        super.init()
    }
    
    // MARK: - Requests
    
    private func performLocalFetch(#URLString: String, completion: ServiceClientCompletion) {
        var transformedURLString = (URLString as NSString).stringByReplacingOccurrencesOfString("/", withString: "-")
        let path = NSBundle.mainBundle().pathForResource(transformedURLString, ofType: "json")!
        var parsedData: AnyObject? = nil
        if let data = NSData(contentsOfFile: path) {
            parsedData = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil)
        }
        dispatch_async(dispatch_get_main_queue()) {
            completion(response: parsedData, error: nil)
        }
    }
    
    private func performRemoteFetch(#URLString: String, completion: ServiceClientCompletion) {
        let url = baseURL?.URLByAppendingPathComponent(URLString)
        let request = NSURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 30.0)
        session = NSURLSession(configuration: configuration)
        let task = session?.dataTaskWithRequest(request) { data, response, error in
            var parsedData: AnyObject? = nil
            if let data = data {
                parsedData = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil)
            }
            dispatch_async(dispatch_get_main_queue()) {
                completion(response: parsedData, error: error)
            }
        }
        task?.resume()
    }
    
    internal func performFetch(#URLString: String, completion: ServiceClientCompletion) {
        if useDummy {
            performLocalFetch(URLString: URLString, completion: completion)
        } else {
            performRemoteFetch(URLString: URLString, completion: completion)
        }
    }
   
}
