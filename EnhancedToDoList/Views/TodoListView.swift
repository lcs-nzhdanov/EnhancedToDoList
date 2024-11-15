//
//  ToDoVoew.swift
//  EnhancedToDoList
//
//  Created by Nikita Zhdanov on 2024-11-12.
//

import SwiftUI

struct TodoListView: View {
    
    // MARK: Stored properties
    
    // Our list of items to complete
    @State private var items: [TodoItem] = []
    
    // The item currently being created
    @State private var newItemDetails = ""
    
    @State private var searchText = ""
    
    var filteredItems: [TodoItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { item in
                item.details.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredItems) { item in
                    NavigationLink {
                        Text(item.details)
                    } label: {
                        Text(item.details)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
        .onAppear {
            // Populate with example data
            if items.isEmpty {
                items.append(contentsOf: exampleData)
            }
        }
        .searchable(text: $searchText)
        
        VStack {
            HStack {
                
                TextField("Enter a to-do item", text: $newItemDetails)
                
                Button("Add") {
                    addItem()
                }
                
            }
            .padding(20)
            
            
            if items.isEmpty {
                
                ContentUnavailableView(label: {
                    Label(
                        "Nothing to do",
                        systemImage: "powersleep"
                    )
                    .foregroundStyle(.green)
                }, description: {
                    Text("To-do items will appear here once you add some.")
                })
                
            } else {
                
                List {
                    ForEach(items) { currentItem in
                        Label {
                            Text(currentItem.details)
                        } icon: {
                            Image(systemName: currentItem.isCompleted ? "checkmark.circle" : "circle")
                                .onTapGesture {
                                    toggle(item: currentItem)
                                }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
        }
        .navigationTitle("Tasks")
    }
    
    
    // MARK: Functions
    func addItem() {
        let newToDoItem = TodoItem(details: newItemDetails)
        items.insert(newToDoItem, at: 0)
        newItemDetails = ""
    }
    
    func toggle(item: TodoItem) {
        if item.isCompleted {
            item.completedOn = nil
            item.isCompleted = false
        } else {
            item.completedOn = Date()
            item.isCompleted = true
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    LandingView()
}
