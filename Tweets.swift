//
//  Tweets.swift
//  TwitterClient
//
//  Created by A Cahn on 3/20/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import Foundation

class Tweets{
    
    static let shared = Tweets()
    
    var allTweets = [Tweet]()
    
    private init(){}
    
    func add(tweet: Tweet) {
        self.allTweets.append(tweet)
    }
    
    func remove(tweet: Tweet) {
        self.allTweets = self.allTweets.filter{ (item) -> Bool in
            return item.id != tweet.id
        }
    }
    
    func removeall() {
        self.allTweets.removeAll()
    }
        
    func getTweetsAt(index: Int) -> Tweet {
         return self.allTweets[index]
    }
    
    func count() -> Int {
         return self.allTweets.count
    }
}
