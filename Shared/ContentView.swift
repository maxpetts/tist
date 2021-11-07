//
//  ContentView.swift
//  Shared
//
//  Created by mp on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @StateObject private var view_model = TodoList()
    @Environment(\.colorScheme) var colourScheme
    
    // TODO: Add empty task_list view : fullscreen => "Click to do todo"
    
    var body: some View {
        let isDarkScheme = colourScheme == .dark
        
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("Enter your next task!", text: $input)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(isDarkScheme ? Color.white : Color.black)
                    .font(.system(size: 25))
                    .padding()
                    .frame(height: 55, alignment: .leading)
                Button (action: {
                    if (input != "") {
                        view_model.addTask(input)
                        input = ""
                    }
                }) {
                    Image(systemName: "plus")
                } // Prominent doesn't exist on macOS & < iOS 15
                .foregroundColor(isDarkScheme ? Color.black : Color.white)
                .keyboardShortcut(.return, modifiers: []) // TODO: Swap this to onCommit function of TextField
                .padding()
            }
            List {
                ForEach(view_model.list) { task in
                    TodoTaskHorizView(task: task, view_model: view_model, isDarkScheme: isDarkScheme)
                        .addRoundBorder(Color.black, width: 3, cornerRadius: 5)
                }
#if os(iOS)
                .onDelete { indexSet in
                    view_model.removeTask(indexSet)
                }
#endif
            }
        }.background(isDarkScheme ? Color.black : Color.white)
    }
}

struct TodoTaskHorizView: View {
    let task: Todo.TodoTask
    let view_model: TodoList
    let isDarkScheme: Bool
    
    var body: some View {
        HStack {
            Text(task.title)
                .padding()
#if os(macOS)
            Spacer()
            Button(action: {
                view_model.removeTask(task)
            }) {
                Image(systemName: "minus")
            }
            .padding()
#endif
        }.background(isDarkScheme ? Color.black : Color.white)
    }
}

// Stealy Stealy: https://stackoverflow.com/questions/57753997/rounded-borders-in-swiftui
extension View {
    public func addRoundBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(ColorScheme.allCases, id: \.self) {
                ContentView().preferredColorScheme($0)
            }
        }
    }
}

