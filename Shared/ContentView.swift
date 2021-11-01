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
                }
            }
            List {
                ForEach(view_model.list) { task in
                    TodoTaskHorizView(task: task)
                }
            }
        }.padding()
    }
}

struct TodoTaskHorizView: View {
    let task: Todo.TodoTask
    
    var body: some View {
        Text(task.title).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let tist = TodoList()
        ContentView(view_model: tist)
    }
}
