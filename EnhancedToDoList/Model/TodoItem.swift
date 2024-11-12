//
//  TodoItem.swift
//  EnhancedToDoList
//
//  Created by Nikita Zhdanov on 2024-11-12.
//

import Foundation
import Observation
 
@Observable
class TodoItem: Identifiable {
    // Identifiable to use an array of instances
    
    let id = UUID()
    var details: String
    let createdOn: Date
    var isCompleted: Bool
    var completedOn: Date?
    
    init(
        details: String,
        createdOn: Date = Date(),
        isCompleted: Bool = false,
        completedOn: Date? = nil
    ) {
        self.details = details
        self.createdOn = createdOn
        self.isCompleted = isCompleted
        self.completedOn = completedOn
    }
 
}
 
let exampleData = [
    
    TodoItem(details: "Go for a walk"),
    TodoItem(details: "Study for Physics"),
    TodoItem(details: "Call mom"),
    
]
