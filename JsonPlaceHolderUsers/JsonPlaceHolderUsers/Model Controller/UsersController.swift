//
//  UsersController.swift
//  JsonPlaceHolderUsers
//
//  Created by Nelson Gonzalez on 3/3/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class UsersController {
    
    private(set) var users: [Users] = []
    
    private let baseUrl = URL(string: "https://jsonplaceholder.typicode.com/users/")!
    
    func fetchUsers(completion: @escaping(Error?)-> Void) {
        let request = baseUrl
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(error)")
                completion(error)
            }
        
            guard let data = data else {
                print("No data returned from the data task")
                completion(NSError())
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let usersDecoded = try decoder.decode([Users].self, from: data)
                self.users.append(contentsOf: usersDecoded)
                completion(nil)
            } catch {
                self.users = []
                print("Error decoding and getting data: \(error)")
                completion(error)
            }
        }.resume()
    }
    
}
