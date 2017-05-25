//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by A Cahn on 3/22/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    @IBOutlet weak var tweetDetails: UILabel!
    
    @IBOutlet weak var userDetails: UILabel!
    
    @IBOutlet weak var retweetDetails: UILabel!
    
    var tweet : Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.userDetails.text = (tweet.user?.name ?? "Unknown")
        self.tweetDetails.text = (tweet.text)
        
        print("Retweet Count: \(tweet.retweetCount)")
        if (tweet.retweetCount < 1) {
            self.retweetDetails.text = "Not a Retweet"
        } else {
            self.retweetDetails.text = "Retweet Count: \(tweet.retweetCount)"
        }
    }
}
