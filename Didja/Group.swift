//
//  File.swift
//  Didja
//
//  Created by Clark Barry on 6/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

class Group: NSObject, TaskDelegate {
    init(owner: User, members: [User], name: String, tasks: [Task]) {
        self.owner = owner
        self.members = members
        self.name = name
        self.tasks = tasks
        super.init()
        for task in tasks {
            task.delegate = self
        }
    }
    
    let owner: User
    private(set) var members: [User]
    private(set) var name: String
    private(set) var tasks: [Task]
    
    func addMember(_ user: User) {
        self.members.append(user)
    }
    
    func updateName(_ name: String) {
        self.name = name
    }
    
    func addTask(_ task: Task) {
        task.delegate = self
        self.tasks.append(task)
    }
    
    // MARK: - TaskDelegate 
    
    func didCompleteTask(_ task: Task, with completionInfo: Task.CompletionInfo) {
        // Notify the server
    }
}
