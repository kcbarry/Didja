//
//  Task.swift
//  Didja
//
//  Created by Clark Barry on 6/22/17.
//  Copyright © 2017 learning. All rights reserved.
//

import Foundation

protocol TaskDelegate: NSObjectProtocol {
    func didCompleteTask(_ task: Task, with completionInfo: Task.CompletionInfo)
}

class Task {
    init(name: String, description: String, completionHistory: [CompletionInfo]) {
        self.id = UUID.init().uuidString
        self.name = name
        self.description = description
        self.completionHistory = completionHistory
    }
    
    let id: String
    private(set) var name: String
    private(set) var description: String
    private(set) var completionHistory: [CompletionInfo]
    
    weak var delegate: TaskDelegate?
    
    struct CompletionInfo {
        let user: User
        let date: Date
    }
    
    func updateName(_ name: String) {
        self.name = name
    }
    
    func updateDescription(_ description: String) {
        self.description = description
    }
    
    func complete(with user: User, at date: Date) {
        let completionInfo = CompletionInfo.init(user: user, date: date)
        self.completionHistory.insert(completionInfo, at: completionHistory.startIndex)
        if let delegate = self.delegate {
            delegate.didCompleteTask(self, with: completionInfo)
        }
    }
}
