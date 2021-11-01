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
            TodoListView()
        } .padding()
    }
}

struct TodoListView: View {
    var body: some View {
        List {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let tist = TodoList()
        ContentView(view_model: tist)
    }
}
