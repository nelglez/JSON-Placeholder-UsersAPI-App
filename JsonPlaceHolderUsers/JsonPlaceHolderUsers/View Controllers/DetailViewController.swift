//
//  ViewController.swift
//  JsonPlaceHolderUsers
//
//  Created by Nelson Gonzalez on 3/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    
    var usersController: UsersController?
    
    var users: Users? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

    private func updateViews() {
        guard isViewLoaded else {return}
        guard let users = users else {return}
        usernameLabel.text = users.username
        nameLabel.text = users.name
        emailLabel.text = users.email
        phoneLabel.text = users.phone
        websiteLabel.text = users.website
        companyNameLabel.text = users.companyWebsite
        
    }

}

