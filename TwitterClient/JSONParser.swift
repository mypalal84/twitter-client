//
//  JSONParser.swift
//  TwitterClient
//
//  Created by A Cahn on 3/20/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import Foundation

typealias JSONParserCallback = (Bool, [Tweet]?)->()
typealias JSONStatusCodeResponse = (Bool, User?)->()

class JSONParser {
    
    static var sampleJSONData: Data {
        guard let tweetJSONPath = Bundle.main.url(forResource: "tweet", withExtension: "json") else {fatalError("Tweet.json does not exist in this bundle")}
        
        do {
            
            let tweetJSONData = try Data(contentsOf: tweetJSONPath)
            
            return tweetJSONData
            
        } catch {
            
            fatalError("Failed to create data from tweetJSONPath")
            
        }
    }
    
    class func statusCodeResponse(data: Data, callback: @escaping JSONStatusCodeResponse) {
            
            do {
                if let userJSON = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    
                    let user = User(json: userJSON)
                        callback(true, user)
                    
                }
            } catch {
                print("Error Searializing JSON")
            }
    }
    
    class func tweetsFrom(data: Data, callback: JSONParserCallback) {
        
        do{
            if let rootObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]] {
                
                var tweets = [Tweet]()
                
                for tweetDictionary in rootObject {
                    if let tweet = Tweet(json: tweetDictionary) {
                        tweets.append(tweet)
                    }
                }
                
                callback(true, tweets)
                
            }
        } catch {
            print("Error Searializing JSON")
            callback(false, nil)
        }
    }
}
