//
//  User.swift
//  Didja
//
//  Created by Clark Barry on 6/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

enum CreateUserError: Error {
    case unknown
    case emailUnavailable
    case passwordTooShort
    
}

enum AuthenticateUserError: Error {
    case invalidCredentials
}

class User {
    static func createUserWith(email: String, displayName: String, password: String, phone: String, completionHandler:@escaping (User?, CreateUserError?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if email == "unavailable@email.com" {
                completionHandler(nil, .emailUnavailable)
            } else if password.characters.count < 3 {
                completionHandler(nil, .passwordTooShort)
            } else {
                let user = User.init(email: email, displayName: displayName, phone: phone, groups: [])
                completionHandler(user, nil)
            }
        }
    }
    
    static func authenticateUserWith(email: String, password: String, completionHandler:@escaping (User?, AuthenticateUserError?) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if email == "test@email.com" && password == "password" {
                let user = User.init(email: email, displayName: "John Doe", phone: "5101234567", groups: [])
                let groups = self.defaultGroups(for: user)
                user.groups = groups
                completionHandler(user, nil)
            }
            else {
                completionHandler(nil, .invalidCredentials)
            }
        }
    }
    
    private init(email: String, displayName: String, phone: String, groups: [Group]) {
        self.id = UUID.init().uuidString
        self.email = email
        self.displayName = displayName
        self.phone = phone
        self.groups = groups
    }
    
    let id: String
    let email: String
    let displayName: String
    let phone: String
    private(set) var groups: [Group]
    
    private static func defaultGroups(for user: User) -> [Group] {
        let jane = User.init(email: "someemail@test.com", displayName: "Jane Doe", phone: "5101800206",groups: [])
        let bob = User.init(email: "anotheremail@test.com", displayName: "Bobby Didja", phone: "2061800510", groups: [])
        
        let feedTheCat = Task.init(name: "Feed the cat", description: "Don't let Mittens starve", completionHistory: [])
        let takeOutTheTrash = Task.init(name: "Take out the trash", description: "Or you don't get no spending cash", completionHistory: [])
        
        let group = Group.init(owner: user, members: [jane, bob], name: "My house", tasks: [feedTheCat, takeOutTheTrash])
        return [group]
    }
    
}
