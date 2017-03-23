//
//  ProfileViewController.swift
//  TwitterClient
//
//  Created by A Cahn on 3/22/17.
//  Copyright © 2017 A Cahn. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImageURL: UILabel!
    
    @IBOutlet weak var location: UILabel!

    var user : User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.name.text = (user.name)
        //self.profileImageURL.text = (user.profileImageURL)
        //self.location.text = (user.location)
        
    }
}
