//
//  ContentView.swift
//  Shared
//
//  Created by mp on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @ObservedObject var view_model: TodoList
    
    // TODO: Add empty task_list view
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your next task!", text: $input)
                Button(action: {
                    if (input != "") {
                        view_model.addTask(input)
                        input = ""
                    }
                }) {
                    Image(systemName: "plus")
                }.keyboardShortcut(.return, modifiers: [])
            }.padding()
            List {
                ForEach(view_model.list) { task in
                    TodoTaskHorizView(task: task, view_model: view_model)
                }
                #if os(iOS)
                .onDelete { indexSet in
                    view_model.removeTask(indexSet)
                }
                #endif
            }
        }
    }
}

struct TodoTaskHorizView: View {
    let task: Todo.TodoTask
    let view_model: TodoList
    
    var body: some View {
        HStack {
            Text(task.title).padding()
            #if os(macOS)
            Spacer()
            Button(action: {
                view_model.removeTask(task)
            }) {
                Image(systemName: "minus")
            }
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let tist = TodoList()
        ContentView(view_model: tist)
    }
}
