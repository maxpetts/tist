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
        todo_list.append(TodoTask("test1"))
        todo_list.append(TodoTask("test2"))
    }
    
    mutating func createTask(title: String) {
        todo_list.append(TodoTask(title))
    }
    
    //    mutating func removeTask(title: String) {
    //        if let index = todo_list.firstIndex(where: {$0.title.contains(title)}) {
    //            todo_list.remove(at: index)
    //        }
    //    }
    
    mutating func removeTask(indexSet: IndexSet) {
        indexSet.forEach({index in
            todo_list.remove(at: index)
        })
    }
    
    mutating func removeTask(task: TodoTask) {
        if let index = todo_list.firstIndex(where: {$0.id == task.id}) {
            todo_list.remove(at: index)
        }
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
