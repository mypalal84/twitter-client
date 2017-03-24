//
//  HomeTimelineViewController.swift
//  TwitterClient
//
//  Created by A Cahn on 3/20/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import UIKit

class HomeTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweetArray = [Tweet]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var profile: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Timeline"
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 50
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let tweetNib = UINib(nibName: "TweetNibCell", bundle: nil)
        
        self.tableView.register(tweetNib, forCellReuseIdentifier: TweetNibCell.identifier)
        
        updateTimeline()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == TweetDetailViewController.identifier {
            
        if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
            let selectedTweet = self.tweetArray[selectedIndex]
                
            guard let destinationContoller = segue.destination as? TweetDetailViewController else { return }
            
            destinationContoller.tweet = selectedTweet
            
            }
            
        }
        
        if segue.identifier == ProfileViewController.identifier {
            
            guard let destinationConroller = segue.destination as? ProfileViewController else { return }
            
            destinationConroller.user = self.profile
        }
        
    }
    
    
    func updateTimeline() {
        
        self.activityIndicator.startAnimating()
        
        API.shared.getTweets { (tweets) in
            
            guard let tweets = tweets else { fatalError("No Tweets") }
            
        API.shared.getUser(callback: { (newUser) in
            
            guard let user = newUser else { fatalError("No Profile") }
            
            OperationQueue.main.addOperation {
                
                self.profile = user
                
            }
        })
            
            OperationQueue.main.addOperation {
                
                self.tweetArray = tweets  
                
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetNibCell.identifier, for: indexPath) as! TweetNibCell
        
//            cell.tweetText.text = tweetArray[indexPath.row].text
        
            let tweet = self.tweetArray[indexPath.row]
        
            cell.tweet = tweet
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: TweetDetailViewController.identifier, sender: nil)
        
    }
}
