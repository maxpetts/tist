//
//  Todo.swift
//  tist
//
//  Created by mp on 26/10/2021.
//

import Foundation

/// - Tag: DataModel
struct Todo {
    private(set) var todo_list: Array<TodoTask>
    
    init(list: Array<TodoTask>) {
        todo_list = list
    }
    
    init() {
        todo_list = Array<TodoTask>()
    }
    
    mutating func createTask(title: String) {
        todo_list.append(TodoTask(title))
    }
    
    struct TodoTask: Identifiable {
        let id = UUID()
        var complete: Bool = false
        let title: String
        
        init(_ p_title: String) {
            title = p_title
        }
    }
}
