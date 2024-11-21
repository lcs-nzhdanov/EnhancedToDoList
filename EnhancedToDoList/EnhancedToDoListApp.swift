//
//  EnhancedToDoListApp.swift
//  EnhancedToDoList
//
//  Created by Nikita Zhdanov on 2024-11-12.
//

import SwiftUI
import SwiftData

@main
struct EnhancedToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
        .modelContainer(for: TodoItem.self)
        
        // Meaning:
        // Create our permanent storage (if not already there).
        // Create this model (TodoItem) in our permanent storage (if not already there).
        // Load the model into the model context.
        // Add the model context to the environment of the view (or window group) it is attached to.
    }
}
