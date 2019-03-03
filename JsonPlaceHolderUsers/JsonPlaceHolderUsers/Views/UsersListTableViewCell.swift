//
//  UsersListTableViewCell.swift
//  JsonPlaceHolderUsers
//
//  Created by Nelson Gonzalez on 3/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class UsersListTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var users: Users? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateViews() {
        guard let users = users else {return}
        usernameLabel.text = users.username
        nameLabel.text = users.name
        emailLabel.text = users.email
    }

    
}
