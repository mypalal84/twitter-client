//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by A Cahn on 3/20/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweetArray = [Tweet]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        JSONParser.tweetsFrom(data: JSONParser.sampleJSONData) { (success, tweets) in
            
            if(success) {
                guard let tweets = tweets else {fatalError("Tweets came back nil")}
                
                Tweets.shared.removeall()
                
                for tweet in tweets {
                    
                    Tweets.shared.add(tweet: tweet)
                    print(tweet.text)
                }
            tweetArray = Tweets.shared.allTweets
            }
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tweets.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let singleTweet = tweetArray[indexPath.row]
        
        cell.textLabel?.text = singleTweet.text
        
        cell.detailTextLabel?.text = singleTweet.user?.name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row at \(indexPath.row)")
    }

}
