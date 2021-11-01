//
//  ContentView.swift
//  Shared
//
//  Created by mp on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    var view_model: TodoList
    
    var body: some View {
        VStack {
            HStack {
                TextField("Input", text: $input)
                Button(action: {
                    print("pressed")
                }) {
                    Image(systemName: "plus")
                }
            }
            List {
                ForEach(view_model.todo_list) { task in
                    TodoTaskHorizView(task: task)
                }
            }        } .padding()
    }
}

struct TodoTaskHorizView: View {
    let task: TodoTask
    
    var body: some View {
        Text(task.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let tist = TodoList()
        ContentView(view_model: tist)
    }
}
