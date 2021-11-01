//
//  TodoVM.swift
//  tist
//
//  Created by mp on 01/11/2021.
//

import Foundation

// - Tag: ViewModel
class TodoList: ObservableObject {
    @Published private(set) var model: Todo = Todo()
    
    var list: Array<Todo.TodoTask> {
        model.todo_list
    }
    
    // MARK: - Intents
    
//
    func addTask(_ taskTitle: String) {
        model.createTask(title: taskTitle)
    }
//
//    mutating func removeTask(_ task: TodoTask) {
//        print("not implem")
//    }
//
//    mutating func removeTask(_ taskTitle: String) {
//        print("not implem")
//    }
}
