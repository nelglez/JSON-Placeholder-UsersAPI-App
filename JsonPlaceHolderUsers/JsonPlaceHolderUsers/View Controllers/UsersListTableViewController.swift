//
//  UsersListTableViewController.swift
//  JsonPlaceHolderUsers
//
//  Created by Nelson Gonzalez on 3/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class UsersListTableViewController: UITableViewController {
    
    let usersController = UsersController()

    override func viewDidLoad() {
        super.viewDidLoad()

       fetchUsers()
       
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        
//        
//    }
    
    private func fetchUsers() {
        usersController.fetchUsers { (error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usersController.users.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UsersListTableViewCell

        let users = usersController.users[indexPath.row]
        cell.users = users

        return cell
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVC = segue.destination as? DetailViewController
        destinationVC?.usersController = usersController
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let users = usersController.users[indexPath.row]
        destinationVC?.users = users
    }
    

}
