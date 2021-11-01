//
//  TodoVM.swift
//  tist
//
//  Created by mp on 01/11/2021.
//

import Foundation

// - Tag: ViewModel
class TodoList {
    var todo_list: Array<TodoTask> = Array<TodoTask>()
    
    // MARK: - Intents
    
    func addTask(_ task: TodoTask) {
        todo_list.append(task)
    }
//
//    mutating func addTask(_ taskTitle: String) {
//        tasks.append(TodoTask(title: taskTitle))
//    }
//
//    mutating func removeTask(_ task: TodoTask) {
//        print("not implem")
//    }
//
//    mutating func removeTask(_ taskTitle: String) {
//        print("not implem")
//    }
}
