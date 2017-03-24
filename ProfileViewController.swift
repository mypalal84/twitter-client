//
//  ProfileViewController.swift
//  TwitterClient
//
//  Created by A Cahn on 3/22/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user : User!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var location: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = "Username: \(user.screenName)"
        location.text = "Location: \(user.location)"
        
    }
    
    
}
