//
//  ContentView.swift
//  Shared
//
//  Created by mp on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Document Title")
            TextEditingView()
        }
    }
}

struct TextEditingView: View {
    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $fullText)
            .padding()
            .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
